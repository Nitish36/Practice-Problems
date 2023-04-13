SELECT DISTINCT fp.post_id,fr.poster,fp.post_text,fp.post_keywords,fp.post_date
FROM facebook_reactions fr,facebook_posts fp
WHERE fr.post_id = fp.post_id AND fr.reaction = 'heart';
