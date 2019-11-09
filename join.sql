--DROP TABLE two_year;
CREATE TABLE two_year (
	id INT,
	sex VARCHAR,
	age INT,
	age_cat VARCHAR,
	race VARCHAR,
	juve_fel_count INT,
	decile_score INT,
	juv_misd_count INT,
	juv_other_count INT,
	prios_count INT,
	c_charge_degree VARCHAR,
	c_charge_desc VARCHAR,
	is_recid INT,
	is_violent INT,
	type_of_assessment VARCHAR,
	decile_score_a INT,
	score_text VARCHAR,
	v_type_of_assessment VARCHAR,
	v_decile_score_v INT,
	v_score_text VARCHAR,
	priors_count INT,
	start INT,
	end_ INT,
	event INT,
	two_year_recid INT
);

SELECT * FROM two_year;

--DROP TABLE weights;
CREATE TABLE weights (
	c_charge_desc VARCHAR,
	violence INT,
	drugs INT,
	theft INT,
	arrest_case_no_charge INT,
	traffic INT,
	disorderly_conduct INT,
	sexual_misconduct INT
);

SELECT * FROM weights;

--DROP TABLE combined;
CREATE TABLE combined AS
	SELECT t.id, t.sex, t.age, t.age_cat, t.race, t.juve_fel_count, t.decile_score,
	t.juv_misd_count, t.juv_other_count, t.prios_count, t.c_charge_degree, t.c_charge_desc,
	w.violence, w.drugs, w.theft, w.arrest_case_no_charge, w.traffic, w.disorderly_conduct,
	w.sexual_misconduct, t.is_recid, t.is_violent, t.type_of_assessment, t.decile_score_a,
	t.score_text, t.v_type_of_assessment, t.v_decile_score_v, t.v_score_text, t.priors_count,
	t.start, t.end_, t.event, t.two_year_recid
	FROM two_year t
	LEFT OUTER JOIN weights w
	ON t.c_charge_desc=w.c_charge_desc;
	
SELECT * FROM combined;

	