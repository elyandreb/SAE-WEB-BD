from flask import Flask, render_template
from datetime import date

from flask_login import current_user, login_required
from project.app import db, app
from project.models import  Cours, Reserver, Utilisateur


@app.route('/accueil/<int:adherent_id>')
@login_required
def accueil(adherent_id):
    
    # Récupérer l'adhérent
    utilisateur = Utilisateur.query.get(adherent_id)

    if not utilisateur:
        return "Adhérent introuvable", 404

    if utilisateur.le_role == "admin":
        return render_template("admin_home.html", utilisateur=utilisateur)
    
    # Trouver le prochain cours réservé par cet adhérent
    prochain_cours = (
        db.session.query(Cours)
        .join(Reserver)
        .filter(Reserver.id_u == adherent_id, Cours.date_c >= date.today())
        .order_by(Cours.date_c.asc())
        .first()
    )

    if utilisateur.le_role == "moniteur":
        today = date.today()
        prochains_cours = (
            Cours.query.filter(Cours.id_u == utilisateur.id_u, Cours.date_c >= today)
            .order_by(Cours.date_c.asc(), Cours.h_de_debut.asc())
            .limit(3)
            .all()
        )
        return render_template("moniteur_home.html", utilisateur=utilisateur, prochains_cours=prochains_cours)
    else:
        reservation = Reserver.query.filter_by(id_u=current_user.id_u, id_c=prochain_cours.id_c).first()
        if reservation:
            prochain_cours.poney_attribue = reservation.poney.nom_po

        return render_template('adherent_home.html', utilisateur=utilisateur, cours=prochain_cours)
