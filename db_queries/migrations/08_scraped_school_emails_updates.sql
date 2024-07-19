START TRANSACTION;

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%doc.alabama.gov%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%publicschoolreview%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%bhamwiki%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%donorschoose%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%frontlineeducation%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%dragonflyathletics%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%app.c2cschools.com%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%greatschools.com%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%greatschools.org%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%hospital%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%juvenile%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%jail%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%prison%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%correctional%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%usnews%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%valleymls%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%trulia%';
DELETE FROM scraped_school_emails WHERE SCH_NAME = 'Groton Dunstable Regional';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%profiles.doe.mass.edu%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%massbaymovers%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%mapquest.com%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%gloverelementaryschool1138%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%nces.ed.gov%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%www.mass.gov%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%https://www.swampscottps.org/contact/%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%https://www.eastlongmeadowma.gov/Directory/Home/DepartmentListing?DID=19%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE '%https://disabilityinfo.org%';
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%https://www.mywpl.org/?q=roosevelt-branch%";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%www.facebook.com%";


UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/gmpes'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/gerald-m-parmenter-elementary-school/grade-2'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/fhs'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/franklin-high-school/students-families'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/ecdc'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/node/17/inftrees'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/oses'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/oak-street-elementary-school/kindergarten'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/jfkes'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/jefferson-elementary-school/grade-4'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/hkes'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/helen-keller-elementary-school/kindergarten'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/rms'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/remington-middle-school/grade-7'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/hmms'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/horacemann/events/98366'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.franklinps.net/o/asms'
WHERE `SCRAPED_WEBSITE` = 'https://www.franklinps.net/annie-sullivan-middle-school/grade-6'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = SCRAPED_WEBSITE_2
WHERE `SCRAPED_WEBSITE` = 'https://www.hatfieldps.net/'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = SCRAPED_WEBSITE_2
WHERE `SCRAPED_WEBSITE` = 'https://ma02212715.schoolwires.net/Domain/8'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.miltonps.org/o/mhss'
WHERE `SCRAPED_WEBSITE` = 'https://www.miltonps.org/'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = SCRAPED_WEBSITE_2
WHERE `SCRAPED_WEBSITE` = 'https://www.nrsd.org/'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.nps.org/o/nhs' WHERE `SCRAPED_WEBSITE` = 'https://www.nps.org/high-school/quick-links'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.nps.org/o/nes' WHERE `SCRAPED_WEBSITE` = 'https://www.nps.org/node/17/common'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.nps.org/o/nms' WHERE `SCRAPED_WEBSITE` = 'https://www.nps.org/middle-school/grade-6'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://www.belmont.k12.ma.us/o/bbes' WHERE `SCRAPED_WEBSITE` = 'https://www.belmont-ma.gov/facilities-department/pages/mary-lee-burbank-elementary-school'

UPDATE scraped_school_emails SET `SCRAPED_WEBSITE` = 'https://winnbrookexl.org/' WHERE `SCRAPED_WEBSITE` = 'https://www.belmont.k12.ma.us/o/wbes'


COMMIT;