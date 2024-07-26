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
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%hospital%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%juvenile%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%jail%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%prison%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%correctional%';
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE '%corrections%';
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE '%correctional%';
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
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.mywpl.org/?q=roosevelt-branch";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%www.facebook.com%";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.orange-elem.org/";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://adc.quincypublicschools.com/";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://seekonkschoolnews.com/2022/04/14/video-seekonk-public-schools-unveils-new-seekonk-transitions-academy/s";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://idjj.illinois.gov/facilities/chicago-iyc.html";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://idjj.illinois.gov/facilities/warrenville-iyc.html";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.dist428.org/";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.yelp.com/biz/project-help-marshall";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.freshstartrecoverycenter.com/locations/";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.merriam-webster.com/dictionary/treatment";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.yelp.com/biz/winnetka-covenant-preschool-wilmette";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.yelp.com/biz/winnetka-covenant-preschool-wilmette";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.yelp.com/biz/west-40-hillside";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=320382490262001";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.niche.com/k12/webster-elementary-school-rushville-il/";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%https://idjj.illinois.gov/%";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%https://schola.com/%";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%http://62906.us/%";

DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%KASEC%";
DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%SEDOL Sector Programs%";
DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.sedol.us/site/default.aspx?PageType=3&ModuleInstanceID=1589&ViewID=82ad4dc1-ff8e-4c91-9428-7a2a172acda0&RenderLoc=0&FlexDataID=875&PageID=26";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.dps61.org/site/default.aspx?PageType=3&ModuleInstanceID=86&ViewID=82ad4dc1-ff8e-4c91-9428-7a2a172acda0&RenderLoc=0&FlexDataID=68&PageID=63";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://bhased.org/";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.k12jobspot.com/School/39363";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.lwase843.org/";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "%deaf%";
DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%deaf%";

DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%visually impaired%";

DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%blind%";

DELETE FROM scraped_school_emails WHERE SCH_NAME LIKE "%rehab%";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.nhm88.com/";

DELETE FROM scraped_school_emails WHERE SCRAPED_WEBSITE LIKE "https://www.wces.co/%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "ECSE AM/PM-Wood Dale Dist 7";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Adams County RSSP";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Academic Behavior&Community Acad";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "New Approach Alternative H S";

DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Tristar Acad Safe Sch Program";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Phoenix Safe Schools Program";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe40.com%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe8.com%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Jo Daviess Carroll CTE Academy%";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe11.org%";

DELETE FROM scraped_school_emails WHERE `LSTREET1` LIKE "730 7Th St";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe17.org%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "technical";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "career";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "vocational";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "voc ctr";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.dupageroe.org/services/alternative-learning-opportunities-program";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe20.org%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%roe21.org%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%schola.com%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://goal.sd308.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.minooka.com/living-here/schools/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.roe26.net%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.chsd218.org/apps/pages/index.jsp?uREC_ID=446448&type=d&pREC_ID=962598";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.s-cook.org%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.ksd111.org/Page/333%";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.bps101.net/paws/";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://ecc.d131.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://gcc.d131.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://hopewall.sd129.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://elc.barrington220.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.d214.org/domain/605";

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.dist126.org/early-childhood-center/about";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "http://www.sowic.org/early-childhood-screening.shtml";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://unit6fms.ss18.sharpschool.com/parents/staff_directory";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/programs/transition";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/programs/directions";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/programs/deaf-and-hard-of-hearing";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/programs/stars";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sased.org/programs/visually-impaired";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.swcccase.org/domain/23";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.swcccase.org/Page/2107";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.swcccase.org/domain/1029";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.swcccase.org/transition";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.swcccase.org/domain/1031";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=010750120261001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://en.wikipedia.org/wiki/L";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.easd13.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.region3sec.org/our-programs.html";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.bethalto.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=320382490262001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.eisencoop.org/en-US";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://eisencoop.org/en-US/development-learning-programs-166b7c37";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://eisencoop.org/en-US/care-program-20a7e692";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sese.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://ps.wc314.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.wcisec.org/index.php/macomb-modulars/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.k12jobspot.com/School/39583";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.plt3.org/o/pes";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://bi-county.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.yelp.com/biz/west-40-hillside";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://schooldistricts.us/district/1700304_vermilion_voc_ed_deliver_system.html";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://rocte.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.d300.org/dchs";

DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Early Childhood%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Pre-School%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Early Learning%";


-- Maine: 38813 - 39409 (596)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "http://www.maine.gov/corrections/longcreek/argould";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "http://www.pembrokemaine.org/htmlfiles/school.html";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.visitlubecmaine.com/about/schools.php";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.sad32.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%www.niche.com%";

-- Illinois: 27707 - 28107 (400)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=060161000022001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=060161000022003";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Early Education%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Early Educ%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=010010030262008";

-- Illinois: 28108 - 28408 (300)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=150162990252265";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=150162990252290";

-- Illinois 28409 - 29094 (600)
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.incschools.org/school/passages-charter-school/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=150162990250848";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.incschools.org/school/christopher-house-charter-school/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=410570100262020";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=410570100262023";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=410570100262024";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=160194280262014";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://adams.estl189.com/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=160194280262011";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=200962000260001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=200962000261001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=200962000262002";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.efyounges.com/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.legacycharterchicago.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%https://sesischools.com%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://sullivanhousehschicago.com/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "%https://yccs.us/%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.kanihelp.org/resources/resource/22/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.u-46.org/site/Default.aspx?PageType=1&SiteID=16&ChannelID=8716&DirectoryType=6";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.u-46.org/site/Default.aspx?PageType=1&SiteID=20&ChannelID=8720&DirectoryType=6";

-- Illinois 29094 - 29210 (116)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.tri-valley3.org/";

-- Illinois 29211 - 29611 (400)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=130410060042001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=410570090262022";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Bond County CUSD 2 ECC";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Wanda Kendall Elem School";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.ksd111.org/Page/353";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.ksd111.org/domain/217";

-- Illinois 29612 - 30012 (400)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.kcud229.org/lyle";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.lamoilleschools.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.lamoilleschools.org/allen-grade-school/";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Prekindergarten%";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%kindergarten%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=500821880220001";

-- Illinois 30013 - 30416 (403)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.bhsroe.org/public-schools/ohio505/";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Early Ch%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.questpeoria.org/Pages/Curriculum";

-- Illinois 30417 - 30717 (400)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.pontiac429.org/o/cs";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=450791340042001";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Queen Bee School";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Riverdale PreSchool Center%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.rimsd41.org/apps/pages/HMELC";
DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "Rossville-Alvin Elem School";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=340491160262007";

-- Illinois 30718 -30918 (200)

DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=041011340042001";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=240320740032001";


-- Illinois 30919 - 31319 (400)

DELETE FROM scraped_school_emails WHERE `SCH_NAME` LIKE "%Erly Chldhd%";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://educarewestdupage.org/";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.illinoisreportcard.com/School.aspx?schoolid=190220330023004";
DELETE FROM scraped_school_emails WHERE `SCRAPED_WEBSITE` LIKE "https://www.ipsd.org/preschool";

