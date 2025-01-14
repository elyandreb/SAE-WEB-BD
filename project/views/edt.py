import random
from flask import flash, redirect, render_template, request, url_for
from flask_login import login_required, current_user
from datetime import date, timedelta
from project.models import Cotiser, Cours, Poney, Reserver
from project import app, db
import locale
from datetime import datetime

@app.route('/edt')
def emploi_du_temps():
    
    # Configurer les dates en français
    locale.setlocale(locale.LC_TIME, 'fr_FR.UTF-8')

    # Récupérer la semaine à afficher
    today = date.today()
    semaine_index = int(request.args.get('week', 0))  # Décalage de la semaine
    semaine_debut = today + timedelta(weeks=semaine_index, days=-today.weekday())
    semaine_fin = semaine_debut + timedelta(days=6)

    # Générer les jours de la semaine
    jours = [semaine_debut + timedelta(days=i) for i in range(7)]

    # Si l'utilisateur est un moniteur
    if current_user.le_role == "moniteur":
        # Récupérer les cours de la semaine pour le moniteur
        cours_semaine = (
            Cours.query.filter(
                Cours.id_u == current_user.id_u,
                Cours.date_c >= semaine_debut,
                Cours.date_c <= semaine_fin
            )
            .order_by(Cours.date_c, Cours.h_de_debut)
            .all()
        )

        # Ajouter les informations des participants pour chaque cours
        for cours in cours_semaine:
            cours.nb_inscriptions = Reserver.query.filter_by(id_c=cours.id_c).count()
            
            reservations = Reserver.query.filter_by(id_c=cours.id_c).all()
            participants = []

            for reservation in reservations:
                participant = {
                    "nom": reservation.user.nom_u,
                    "prenom": reservation.user.prenom_u,
                    "poney": reservation.poney.nom_po if reservation.poney else None
                }
                participants.append(participant)

            cours.participants = participants
            

        # Générer les horaires
        horaires = range(9, 21)  # De 9h à 20h

        return render_template('edt_moniteur.html', semaine_debut=semaine_debut, jours=jours, horaires=horaires, cours_semaine=cours_semaine, previous_week=semaine_index - 1, next_week=semaine_index + 1, utilisateur=current_user)

    # Si l'utilisateur est un adhérent
    elif current_user.le_role == "adherent":

        # Récupérer les cours de la semaine
        cours_semaine = Cours.query.filter(
            Cours.date_c >= semaine_debut,
            Cours.date_c <= semaine_fin
        ).order_by(Cours.date_c, Cours.h_de_debut).all()

        # Ajouter les informations d'inscription pour chaque cours
        for cours in cours_semaine:
            cours.inscrit = Reserver.query.filter_by(id_u=current_user.id_u, id_c=cours.id_c).first() is not None
            
            # Nombre de personnes inscrites à ce cours
            cours.nb_inscriptions = Reserver.query.filter_by(id_c=cours.id_c).count()

            # Ajoutez une information pour savoir si le cours est passé
            cours.est_passe = datetime.combine(cours.date_c, datetime.min.time()) < datetime.now()

            # Récupérez le poney associé si l'utilisateur est inscrit
            reservation = Reserver.query.filter_by(id_u=current_user.id_u, id_c=cours.id_c).first()
            if reservation:
                cours.poney_attribue = reservation.poney.nom_po



        # Générer les horaires
        horaires = range(9, 21)  # De 9h à 20h
        print(jours)
        return render_template(
            'edt_adherent.html',
            utilisateur=current_user,
            semaine_debut=semaine_debut,
            jours=jours,
            horaires=horaires,
            cours_semaine=cours_semaine,
            previous_week=semaine_index - 1,
            next_week=semaine_index + 1,
        )

@app.route('/inscription/<int:cours_id>')
@login_required
def inscrire_au_cours(cours_id):
    
    jour = date.today() # date actuelle
    annee = jour.year

    # Vérifier si l'adhérent a une cotisation valide pour ce cours (dans la période de cotisation)
    if date(annee, 9, 1) < jour < date(annee, 12, 31) :
        cotisation = Cotiser.query.filter_by(id_u=current_user.get_id(), annee_debut=annee, annee_fin=annee+1).first()
    else : 
        cotisation = Cotiser.query.filter_by(id_u=current_user.get_id(), annee_debut=annee-1, annee_fin=annee).first()

    if cotisation.paye : 
        # Trouver les poneys déjà réservés pour ce cours
        poneys_reserves = [reservation.id_po for reservation in Reserver.query.filter_by(id_c=cours_id).all()]

        # Sélectionner un poney aléatoire non réservé
        poneys_disponibles = Poney.query.filter(Poney.id_po.notin_(poneys_reserves)).all()

        # Choisir un poney aléatoire
        poney_choisi = random.choice(poneys_disponibles)

        # Créez une nouvelle réservation
        nouvelle_reservation = Reserver(id_u=current_user.id_u, id_c=cours_id, id_po=poney_choisi.id_po)
        db.session.add(nouvelle_reservation)
        db.session.commit()

        flash("Inscription réussie !", "success")
        return redirect(url_for('emploi_du_temps'))
    
    else : 
        flash("Inscription impossible !", "danger")
        return redirect(url_for('emploi_du_temps'))

@app.route('/desinscription/<int:cours_id>')
@login_required
def desinscrire_du_cours(cours_id):

    # Vérifiez si l'utilisateur est inscrit au cours
    inscription = Reserver.query.filter_by(id_u=current_user.id_u, id_c=cours_id).first()

    # Supprimer l'inscription
    db.session.delete(inscription)
    db.session.commit()

    flash("Vous avez été désinscrit du cours avec succès", "success")

    return redirect(url_for('emploi_du_temps'))
