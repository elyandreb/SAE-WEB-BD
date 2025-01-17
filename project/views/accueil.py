from flask import Flask, render_template
from datetime import date

from flask_login import current_user, login_required
from project.app import db, app
from project.models import Cours, Reserver, Utilisateur


@app.route('/accueil/<int:adherent_id>')
@login_required
def accueil(adherent_id):

    # Récupérer l'adhérent
    utilisateur = Utilisateur.query.get(adherent_id)

    if not utilisateur:
        return "Adhérent introuvable", 404

    if utilisateur.le_role == "admin":
        return render_template("admin_home.html", utilisateur=utilisateur)

    if utilisateur.le_role == "moniteur":
        prochains_cours = Cours.get_3_prochain_cours(adherent_id)
        for cours in prochains_cours:
            cours.nb_inscriptions = Reserver.get_nb_inscription(cours.id_c)
            reservations = Reserver.get_reservations_by_cours(cours.id_c)
            participants = []

            for reservation in reservations:
                participant = {
                    "nom":
                        reservation.user.nom_u,
                    "prenom":
                        reservation.user.prenom_u,
                    "poney":
                        reservation.poney.nom_po if reservation.poney else None
                }
                participants.append(participant)

            cours.participants = participants
        return render_template("moniteur_home.html",
                               utilisateur=utilisateur,
                               prochains_cours=prochains_cours)

    else:
        # Trouver le prochain cours réservé par cet adhérent
        prochain_cours = Cours.get_prochain_cours(adherent_id)
        if prochain_cours :
            reservation = Reserver.get_reservation_utilisateur_by_cours(current_user.id_u,prochain_cours.id_c)
            if reservation:
                prochain_cours.poney_attribue = reservation.poney.nom_po

        return render_template('adherent_home.html',
                               utilisateur=utilisateur,
                               cours=prochain_cours)
