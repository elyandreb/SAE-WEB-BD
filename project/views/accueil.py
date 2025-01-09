from flask import Flask, render_template
from datetime import date

from flask_login import login_required
from project.app import db, app
from project.models import Adherent, Cotisation, Cotiser, Cours, Moniteur, Reserver


@app.route('/accueil/<int:adherent_id>')
def accueil(adherent_id):
    
    # Récupérer l'adhérent
    adherent = Adherent.query.get(adherent_id)

    if not adherent:
        return "Adhérent introuvable", 404

    # Trouver le prochain cours réservé par cet adhérent
    prochain_cours = (
        db.session.query(Cours)
        .join(Reserver)
        .filter(Reserver.id_a == adherent_id, Cours.date_c >= date.today())
        .order_by(Cours.date_c.asc())
        .first()
    )
    return render_template('home.html', adherent=adherent, cours=prochain_cours)
