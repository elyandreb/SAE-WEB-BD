from flask import render_template, request
from flask_login import login_required, current_user
from datetime import date, timedelta
from project.models import Cours, Reserver
from project import app, db
import locale

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


