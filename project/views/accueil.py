from flask import Flask, render_template
from datetime import date

from flask_login import login_required
from project.app import db, app
from project.models import  Cours, Reserver, Utilisateur


@app.route('/accueil/<int:adherent_id>')
def accueil(adherent_id):
    
    # Récupérer l'adhérent
    adherent = Utilisateur.query.get(adherent_id)

    if not adherent:
        return "Adhérent introuvable", 404

    if adherent.le_role == "admin":
        return render_template("admin_home.html", adherent=adherent)
    
    # Trouver le prochain cours réservé par cet adhérent
    prochain_cours = (
        db.session.query(Cours)
        .join(Reserver)
        .filter(Reserver.id_u == adherent_id, Cours.date_c >= date.today())
        .order_by(Cours.date_c.asc())
        .first()
    )

    if adherent.le_role == "moniteur":
        today = date.today()
        prochains_cours = (
            Cours.query.filter(Cours.id_u == adherent.id_u, Cours.date_c >= today)
            .order_by(Cours.date_c.asc(), Cours.h_de_debut.asc())
            .limit(3)
            .all()
        )
        return render_template("moniteur_home.html", adherent=adherent, prochains_cours=prochains_cours)
    else:
        return render_template('adherent_home.html', adherent=adherent, cours=prochain_cours)
