//
//  ViewController.swift
//  juxtaposed_prototype
//
//  Created by Julia on 1/17/17.
//  Copyright © 2017 Julia Geist. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var stanceInfo: [String] = []
    
    @IBOutlet weak var politicianImageView: UIImageView!
    @IBOutlet weak var issueTextLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    let abortionStanceArray: [String] = [    "Don't go back to criminalizing women and doctors. (Sep 2010)", "Baby is born at birth, not at partial-birth. (Apr 2006)", "Condemns restrictions on embryonic stem cell research. (Aug 2004)", "Voted NO on restricting UN funding for population control policies. (Mar 2009)", "Voted NO on defining unborn child as eligible for SCHIP. (Mar 2008)", "Voted NO on prohibiting minors crossing state lines for abortion. (Mar 2008)", "Voted NO on barring HHS grants to organizations that perform abortions. (Oct 2007)", "Voted YES on expanding research to more embryonic stem cell lines. (Apr 2007)", "Voted NO on notifying parents of minors who get out-of-state abortions. (Jul 2006)", "Voted YES on $100M to reduce teen pregnancy by education & contraceptives. (Mar 2005)", "Voted NO on criminal penalty for harming unborn fetus during other crime. (Mar 2004)", "Voted NO on banning partial birth abortions except for maternal life. (Mar 2003)", "Voted NO on maintaining ban on Military Base Abortions. (Jun 2000)", "Voted NO on banning human cloning. (Feb 1998)", "Endorsed Recommended by EMILY's List of pro-choice women. (Apr 2001)", "Rated 100% by NARAL, indicating a pro-choice voting record. (Dec 2003)", "Expand embryonic stem cell research. (Jun 2004)", "Sponsored bill providing contraceptives for low-income women. (May 2006)", "Sponsored bill for emergency contraception for rape victims. (Sep 2006)", "Rated 0% by the NRLC, indicating a pro-choice stance. (Dec 2006)", "Provide emergency contraception at military facilities. (Apr 2007)", "Opposes prohibiting human embryonic stem cell research. (Aug 2010)", "Let military perform abortions in cases of rape or incest. (Jun 2011)", "Require pharmacies to fulfill contraceptive prescriptions. (Jul 2011)", "Ban anti-abortion limitations on abortion services. (Nov 2013)", "Access safe, legal abortion without restrictions. (Jan 2015)", "Protect the reproductive rights of women. (Jan 1993)", "Ensure access to and funding for contraception. (Feb 2007)", "Focus on preventing pregnancy, plus emergency contraception. (Jan 2009)", "Emergency contraception at all military health facilities. (Dec 2009)" ]
    
    let budgetAndEconArray: [String] = ["Voted YES on $192B additional anti-recession stimulus spending. (Jul 2009)", "Voted YES on modifying bankruptcy rules to avoid mortgage foreclosures. (May 2009)", "Voted YES on additional $825 billion for economic recovery package. (Feb 2009)", "Voted YES on $60B stimulus package for jobs, infrastructure, & energy. (Sep 2008)", "Voted NO on paying down federal debt by rating programs' effectiveness. (Mar 2007)", "Voted NO on $40B in reduced federal overall spending. (Dec 2005)", "Voted NO on prioritizing national debt reduction below tax cuts. (Apr 2000)", "Voted YES on 1998 GOP budget. (May 1997)", "Voted NO on Balanced-budget constitutional amendment. (Mar 1997)", "Supports the stimulus bill. (Sep 2010)", "Require full disclosure about subprime mortgages. (Dec 2007)", "Reform mortgage rules to prevent foreclosure & bankruptcy. (Feb 2008)" ]
    
    let civilRightsArray: [String] = ["Full equality only with same-sex marriage. (Sep 2010)", "No constitutional ban on gay marriage. (Aug 2004)", "Voted YES on reauthorizing the Violence Against Women Act. (Feb 2013)", "Voted NO on recommending Constitutional ban on flag desecration. (Jun 2006)", "Voted NO on constitutional ban of same-sex marriage. (Jun 2006)", "Voted YES on adding sexual orientation to definition of hate crimes. (Jun 2002)", "Voted YES on loosening restrictions on cell phone wiretapping. (Oct 2001)", "Voted YES on expanding hate crimes to include sexual orientation. (Jun 2000)", "Voted YES on setting aside 10% of highway funds for minorities & women. (Mar 1998)", "Voted NO on ending special funding for minority & women-owned business. (Oct 1997)", "Voted NO on prohibiting same-sex marriage. (Sep 1996)", "Voted YES on prohibiting job discrimination by sexual orientation. (Sep 1996)", "Voted NO on Amendment to prohibit flag burning. (Dec 1995)", "Voted NO on banning affirmative action hiring with federal funds. (Jul 1995)", "Rated 60% by the ACLU, indicating a mixed civil rights voting record. (Dec 2002)", "Issue a commemorative postage stamp of Rosa Parks. (Dec 2005)", "Rated 100% by the HRC, indicating a pro-gay-rights stance. (Dec 2006)", "Rated 100% by the NAACP, indicating a pro-affirmative-action stance. (Dec 2006)", "Recognize Juneteenth as historical end of slavery. (Jun 2008)", "ENDA: prohibit employment discrimination for gays. (Jun 2009)", "Supports Employment Non-Discrimination Act (ENDA). (Sep 2010)", "Prohibit sexual-identity discrimination at schools. (Mar 2011)", "Constitutional Amendment for women's equal rights. (Jun 2011)", "Enforce against wage discrimination based on gender. (Jan 2013)", "Enforce against anti-gay discrimination in public schools. (Jun 2013)", "Provide benefits to domestic partners of Federal employees. (Dec 2007)", "Re-introduce the Equal Rights Amendment. (Mar 2007)", "Reinforce anti-discrimination and equal-pay requirements. (Jan 2008)", "Honor the 100th anniversary of the NAACP. (Jan 2009)" ]
    
    let corporationArray: [String] = ["Voted YES on repealing tax subsidy for companies which move US jobs offshore. (Mar 2005)", "Voted NO on reforming bankruptcy to include means-testing & restrictions. (Mar 2005)", "Voted NO on restricting rules on personal bankruptcy. (Jul 2001)", "Rated 22% by the US COC, indicating an anti-business voting record. (Dec 2003)", "Expand lending caps for credit unions to small business. (Mar 2012)", "Rated 86% by UFCW, indicating an anti-management/pro-labor record. (May 2012)"]
    
    let crimeArray: [String] = ["Voted YES on reinstating $1.15 billion funding for the COPS Program. (Mar 2007)", "Voted YES on $1.15 billion per year to continue the COPS program. (May 1999)", "Voted NO on limiting death penalty appeals. (Apr 1996)", "Voted NO on limiting product liability punitive damage awards. (Mar 1996)", "Voted NO on restricting class-action lawsuits. (Dec 1995)", "Voted NO on repealing federal speed limits. (Jun 1995)", "Voted NO on mandatory prison terms for crimes involving firearms. (May 1994)", "Voted NO on rejecting racial statistics in death penalty appeals. (May 1994)", "Rated 75% by CURE, indicating pro-rehabilitation crime votes. (Dec 2000)", "Moratorium on death penalty; more DNA testing. (Mar 2001)", "More funding and stricter sentencing for hate crimes. (Apr 2001)", "Require DNA testing for all federal executions. (Mar 2001)", "Increase funding for 'COPS ON THE BEAT' program. (Jan 2007)", "Reduce recidivism by giving offenders a Second Chance. (Mar 2007)", "Supports more severe penalties for Hate Crimes. (Aug 2010)", "Facilitate recovering crime victim restitution fees. (Apr 2011)", "Rated 73% by the NAPO, indicating a moderate stance on police issues. (Dec 2014)" ]
    
    let drugsArray: [String] = ["Voted NO on increasing penalties for drug offenses. (Nov 1999)", "Voted NO on spending international development funds on drug control. (Jul 1996)", "Federal grants to Indian tribes to fight methamphetamine. (Dec 2006)", "Require chemical resellers to certify against meth use. (Sep 2007)" ]
    
    let educationArray: [String] = ["$1.2 billion to save the jobs of 16,500 California teachers. (Sep 2010)",
    "Voted YES on additional $10.2B for federal education & HHS projects. (Oct 2007)",
    "Voted YES on $52M for '21st century community learning centers'. (Oct 2005)",
    "Voted YES on $5B for grants to local educational agencies. (Oct 2005)",
    "Voted YES on shifting $11B from corporate tax loopholes to education. (Mar 2005)",
    "Voted YES on funding smaller classes instead of private tutors. (May 2001)",
    "Voted YES on spending $448B of tax cut on education & debt reduction. (Apr 2001)",
    "Voted NO on Educational Savings Accounts. (Mar 2000)",
    "Voted NO on allowing more flexibility in federal school rules. (Mar 1999)",
    "Voted NO on education savings accounts. (Jun 1998)",
    "Voted NO on school vouchers in DC. (Sep 1997)",
    "Voted NO on $75M for abstinence education. (Jul 1996)",
    "Voted NO on requiring schools to allow voluntary prayer. (Jul 1994)",
    "Voted YES on national education standards. (Feb 1994)",
    "Rated 91% by the NEA, indicating pro-public education votes. (Dec 2003)",
    "Opposes less federal or more local control of education. (Sep 2010)" ]
    
    let energyAndOilArray: [String] = ["Global warming means future devastating effects. (Feb 2012)",
    "Work with China on global warming, but California leads. (Sep 2010)",
    "Prop. 23: California clean energy policy creates jobs here. (Sep 2010)",
    "Voted NO on barring EPA from regulating greenhouse gases. (Apr 2011)",
    "Voted NO on protecting middle-income taxpayers from a national energy tax. (Apr 2009)",
    "Voted NO on requiring full Senate debate and vote on cap-and-trade. (Apr 2009)",
    "Voted YES on tax incentives for energy production and conservation. (Jun 2008)",
    "Voted YES on addressing CO2 emissions without considering India & China. (May 2008)",
    "Voted YES on making oil-producing and exporting cartels illegal. (Jun 2007)",
    "Voted YES on factoring global warming into federal project planning. (May 2007)",
    "Voted YES on disallowing an oil leasing program in Alaska's ANWR. (Nov 2005)",
    "Voted YES on $3.1B for emergency oil assistance for hurricane-hit areas. (Oct 2005)",
    "Voted YES on reducing oil usage by 40% by 2025 (instead of 5%). (Jun 2005)",
    "Voted YES on banning drilling in the Arctic National Wildlife Refuge. (Mar 2005)",
    "Voted NO on Bush Administration Energy Policy. (Jul 2003)",
    "Voted YES on targeting 100,000 hydrogen-powered vehicles by 2010. (Jun 2003)",
    "Voted YES on removing consideration of drilling ANWR from budget bill. (Mar 2003)",
    "Voted NO on drilling ANWR on national security grounds. (Apr 2002)",
    "Voted NO on terminating CAFE standards within 15 months. (Mar 2002)",
    "Voted NO on preserving budget for ANWR oil drilling. (Apr 2000)",
    "Voted YES on ending discussion of CAFE fuel efficiency standards. (Sep 1999)",
    "Voted NO on defunding renewable and solar energy. (Jun 1999)",
    "Voted NO on approving a nuclear waste repository. (Apr 1997)",
    "Voted NO on do not require ethanol in gasoline. (Aug 1994)",
    "Keep climate change in EPA 'State of the Environment' report. (Jun 2003)",
    "Keep efficient air conditioner rule to conserve energy. (Mar 2004)",
    "Require public notification when nuclear releases occur. (Mar 2006)",
    "Rated 100% by the CAF, indicating support for energy independence. (Dec 2006)",
    "Sign on to UN Framework Convention on Climate Change. (Jan 2007)",
    "Supports passage of Cap-and-Trade energy legislation. (Sep 2010)",
    "50% clean and carbon free electricity by 2030. (Mar 2016)",
    "Designate sensitive ANWR area as protected wilderness. (Nov 2007)",
    "Let states define stricter-than-federal emission standards. (Jan 2008)" ]
    
    let environmentArray: [String] = ["1989: Dolphin-Safe Tuna bill, against ocean-sweeping nets. (Oct 2010)",
    "Voted YES on protecting ocean, coastal, and Great Lakes ecosystems. (May 2013)",
    "Voted YES on $2 billion more for Cash for Clunkers program. (Aug 2009)",
    "Voted NO on prohibiting eminent domain for use as parks or grazing land. (Dec 2007)",
    "Voted YES on including oil & gas smokestacks in mercury regulations. (Sep 2005)",
    "Voted NO on confirming Gale Norton as Secretary of Interior. (Jan 2001)",
    "Voted NO on more funding for forest roads and fish habitat. (Sep 1999)",
    "Voted NO on transportation demo projects. (Mar 1998)",
    "Voted YES on reducing funds for road-building in National Forests. (Sep 1997)",
    "Voted YES on continuing desert protection in California. (Oct 1994)",
    "Voted NO on requiring EPA risk assessments. (May 1994)",
    "End commercial whaling and illegal trade in whale meat. (Jun 2001)",
    "Support UNCED Rio Declaration at 2002 conference. (Jul 2002)",
    "Rated 89% by the LCV, indicating pro-environment votes. (Dec 2003)",
    "EPA must do better on mercury clean-up. (Apr 2004)",
    "Establish commission to examine Katrina response. (Sep 2005)",
    "Promote conservation of rare felids & canids. (Mar 2007)",
    "Celebrate the recovery of the bald eagle. (Jun 2008)",
    "Regulate all dog breeders down to kennels of 50 dogs. (Feb 2011)",
    "Rated 100% by HSLF, indicating a pro-animal welfare voting record. (Jan 2012)",
    "Sponsored enforcing against illegal ocean fishing. (Mar 2013)",
    "Sponsored matching grants for wetlands conservation projects. (Apr 2013)",
    "Require labeling genetically engineered food. (Apr 2013)",
    "Strengthen prohibitions against animal fighting. (Jan 2007)",
    "Fund projects for international conservation of cranes. (Jan 2009)" ]

    
    let familiesAndChildrenArray: [String] = ["Voted YES on killing restrictions on violent videos to minors. (May 1999)",
    "Rated 0% by the Christian Coalition: an anti-Family-Value voting record. (Dec 2003)",
    "Sex Ed including both abstinence and contraception. (Mar 2009)",
    "More funding & services for victims of domestic violence. (Feb 2013)",
    "Teach teens about both abstinence & contraception. (Mar 2009)" ]
    
    let foreignPolicyArray: [String] = ["Voted NO on cooperating with India as a nuclear power. (Oct 2008)",
    "Voted YES on enlarging NATO to include Eastern Europe. (May 2002)",
    "Voted YES on killing a bill for trade sanctions if China sells weapons. (Sep 2000)",
    "Voted NO on capping foreign aid at only $12.7 billion. (Oct 1999)",
    "Voted YES on limiting the President's power to impose economic sanctions. (Jul 1998)",
    "Voted NO on limiting NATO expansion to only Poland, Hungary & Czech. (Apr 1998)",
    "Voted YES on $17.9 billion to IMF. (Mar 1998)",
    "Voted NO on Strengthening of the trade embargo against Cuba. (Mar 1996)",
    "Voted YES on ending Vietnam embargo. (Jan 1994)",
    "Multi-year commitment to Africa for food & medicine. (Apr 2001)",
    "Impose sanctions and an import ban on Burma. (Oct 2007)",
    "Implement Darfur Peace Agreement with UN peacekeeping force. (Feb 2008)",
    "Seeds of Peace: promote coexistence in regions of conflict. (Apr 2008)",
    "Rated +4 by AAI, indicating pro-Arab pro-Palestine voting record. (May 2012)",
    "Sponsored integrating gender into diplomacy and foreign aid. (Aug 2012)",
    "Sponsored funding and supplying the Syrian rebels. (May 2013)",
    "Acknowledge the Armenian Genocide of the early 1900s. (Mar 2007)",
    "Call for Burma's junta to release political prisoners. (Jun 2007)",
    "Develop a strategy to protect civilians in Darfur. (Feb 2007)",
    "Allow travel between the United States and Cuba. (Feb 2009)",
    "Sponsored bill condemning Afghan violation of women's rights. (Apr 2009)",
    "Pressure friendly Arab states to end Israeli boycott. (Oct 2007)" ]
    
    let freeTradeArray: [String] = ["Voted NO on promoting free trade with Peru. (Dec 2007)",
    "Voted NO on implementing CAFTA for Central America free-trade. (Jul 2005)",
    "Voted NO on establishing free trade between US & Singapore. (Jul 2003)",
    "Voted NO on establishing free trade between the US and Chile. (Jul 2003)",
    "Voted NO on extending free trade to Andean nations. (May 2002)",
    "Voted YES on granting normal trade relations status to Vietnam. (Oct 2001)",
    "Voted YES on removing common goods from national security export rules. (Sep 2001)",
    "Voted YES on permanent normal trade relations with China. (Sep 2000)",
    "Voted NO on expanding trade to the third world. (May 2000)",
    "Voted YES on imposing trade sanctions on Japan for closed market. (May 1995)",
    "Rated 17% by CATO, indicating a pro-fair trade voting record. (Dec 2002)",
    "Extend trade restrictions on Burma to promote democracy. (Jun 2007)",
    "$25B more loans from Export-Import Bank. (Apr 2015)",
    "Rated 38% by the USAE, indicating support for trade sanctions. (Dec 2012)" ]
    
    let governmentReform: [String] = ["2009 Ethics chair: 125 allegations; only 1 admonition. (Apr 2010)",
    "Voted YES on Congressional pay raise. (Jul 2009)",
    "Voted YES on providing a US House seat for the District of Columbia. (Feb 2009)",
    "Voted YES on granting the District of Columbia a seat in Congress. (Sep 2007)",
    "Voted NO on requiring photo ID to vote in federal elections. (Jul 2007)",
    "Voted NO on allowing some lobbyist gifts to Congress. (Mar 2006)",
    "Voted NO on establishing the Senate Office of Public Integrity. (Mar 2006)",
    "Voted YES on banning 'soft money' contributions and restricting issue ads. (Mar 2002)",
    "Voted NO on require photo ID (not just signature) for voter registration. (Feb 2002)",
    "Voted YES on banning campaign donations from unions & corporations. (Apr 2001)",
    "Voted YES on funding for National Endowment for the Arts. (Aug 1999)",
    "Voted YES on favoring 1997 McCain-Feingold overhaul of campaign finance. (Oct 1997)",
    "Voted NO on Approving the presidential line-item veto. (Mar 1996)",
    "Voted NO on banning more types of Congressional gifts. (Jul 1995)",
    "Make Election Day a national holiday. (Aug 2001)",
    "Establish the United States Public Service Academy. (Mar 2007)",
    "Prohibit voter intimidation in federal elections. (Mar 2007)",
    "Require Internet disclosure of all earmarks. (May 2010)",
    "Require full disclosure of independent campaign expenditures. (Jul 2012)",
    "Matching fund for small donors, with debate requirements. (Apr 2013)",
    "Public financing of federal campaigns by voter vouchers. (Feb 2015)" ]
    
    let gunControlArray: [String] = ["Assault weapon ban has kept people safe. (Sep 2010)",
    "Voted YES on banning high-capacity magazines of over 10 bullets. (Apr 2013)",
    "Voted NO on allowing firearms in checked baggage on Amtrak trains. (Apr 2009)",
    "Voted NO on prohibiting lawsuits against gun manufacturers. (Jul 2005)",
    "Voted NO on banning lawsuits against gun manufacturers for gun violence. (Mar 2004)",
    "Voted YES on background checks at gun shows. (May 1999)",
    "Voted NO on more penalties for gun & drug violations. (May 1999)",
    "Voted NO on loosening license & background checks at gun shows. (May 1999)",
    "Voted NO on maintaining current law: guns sold without trigger locks. (Jul 1998)",
    "Close the Gun Show Loophole; restrict show sales. (May 2009)",
    "Rated F by the NRA, indicating a pro-gun control voting record. (Aug 2010)",
    "Ban large-capacity ammunition. (Jan 2013)" ]
    
    let healthCareArray: [String] = ["Voted NO on the Ryan Budget: Medicare choice, tax & spending cuts. (May 2011)",
    "Voted YES on regulating tobacco as a drug. (Jun 2009)",
    "Voted YES on expanding the Children's Health Insurance Program. (Jan 2009)",
    "Voted YES on overriding veto on expansion of Medicare. (Jul 2008)",
    "Voted NO on means-testing to determine Medicare Part D premium. (Mar 2008)",
    "Voted NO on allowing tribal Indians to opt out of federal healthcare. (Feb 2008)",
    "Voted YES on adding 2 to 4 million children to SCHIP eligibility. (Nov 2007)",
    "Voted YES on requiring negotiated Rx prices for Medicare part D. (Apr 2007)",
    "Voted NO on limiting medical liability lawsuits to $250,000. (May 2006)",
    "Voted YES on expanding enrollment period for Medicare Part D. (Feb 2006)",
    "Voted YES on increasing Medicaid rebate for producing generics. (Nov 2005)",
    "Voted YES on negotiating bulk purchases for Medicare prescription drug. (Mar 2005)",
    "Voted YES on $40 billion per year for limited Medicare prescription drug benefit. (Jun 2003)",
    "Voted YES on allowing reimportation of Rx drugs from Canada. (Jul 2002)",
    "Voted YES on allowing patients to sue HMOs & collect punitive damages. (Jun 2001)",
    "Voted NO on funding GOP version of Medicare prescription drug benefit. (Apr 2001)",
    "Voted NO on limiting self-employment health deduction. (Jul 1999)",
    "Voted YES on increasing tobacco restrictions. (Jun 1998)",
    "Voted NO on Medicare means-testing. (Jun 1997)",
    "Voted YES on blocking medical savings acounts. (Apr 1996)",
    "Let states make bulk Rx purchases, and other innovations. (May 2003)",
    "Increase funding to combat the global HIV/AIDS epidemic. (Mar 2003)",
    "Rated 100% by APHA, indicating a pro-public health record. (Dec 2003)",
    "Improve services for people with autism & their families. (Apr 2007)",
    "Establish a national childhood cancer database. (Mar 2007)",
    "Merge Alzheimers diagnosis and care benefit. (May 2013)",
    "Preserve access to Medicaid & SCHIP during economic downturn. (Apr 2008)",
    "Expand the National Health Service Corps. (Mar 2009)" ]
    
    let homelandSecurityArray: [String] = ["Military procurement reform based on $7,600 coffeepots. (Jul 2000)",
    "Voted YES on extending the PATRIOT Act's roving wiretaps. (Feb 2011)",
    "Voted NO on cutting $221M in benefits to Filipinos who served in WWII US Army. (Apr 2008)",
    "Voted YES on requiring FISA court warrant to monitor US-to-foreign calls. (Feb 2008)",
    "Voted YES on limiting soldiers' deployment to 12 months. (Jul 2007)",
    "Voted YES on implementing the 9/11 Commission report. (Mar 2007)",
    "Voted YES on preserving habeas corpus for Guantanamo detainees. (Sep 2006)",
    "Voted YES on requiring CIA reports on detainees & interrogation methods. (Sep 2006)",
    "Voted YES on reauthorizing the PATRIOT Act. (Mar 2006)",
    "Voted NO on extending the PATRIOT Act's wiretap provision. (Dec 2005)",
    "Voted YES on restricting business with entities linked to terrorism. (Jul 2005)",
    "Voted YES on restoring $565M for states' and ports' first responders. (Mar 2005)",
    "Voted YES on adopting the Comprehensive Nuclear Test Ban Treaty. (Oct 1999)",
    "Voted NO on allowing another round of military base closures. (May 1999)",
    "Voted NO on cutting nuclear weapons below START levels. (May 1999)",
    "Voted YES on deploying National Missile Defense ASAP. (Mar 1999)",
    "Voted YES on military pay raise of 4.8%. (Feb 1999)",
    "Voted NO on prohibiting same-sex basic training. (Jun 1998)",
    "Voted YES on favoring 36 vetoed military projects. (Oct 1997)",
    "Voted YES on banning chemical weapons. (Apr 1997)",
    "Voted NO on considering deploying NMD, and amending ABM Treaty. (Jun 1996)",
    "Voted NO on 1996 Defense Appropriations. (Sep 1995)",
    "Federalize aviation security. (Nov 2001)",
    "Rated 100% by SANE, indicating a pro-peace voting record. (Dec 2003)",
    "Improve mental health care benefits for returning veterans. (Jun 2008)",
    "Repeal Don't-Ask-Don't-Tell, and reinstate discharged gays. (Mar 2010)",
    "Non-proliferation includes disposing of nuclear materials. (Aug 2014)",
    "Restore habeas corpus for detainees in the War on Terror. (Jun 2007)",
    "Establish global strategy to defeat al Qaeda. (Feb 2008)",
    "Expand health services for women veterans. (Mar 2009)" ]
    
    let immigrationArray: [String] = ["Cosponsored DREAM Act: legal status from college or military. (Sep 2010)",
    "Voted YES on continuing federal funds for declared 'sanctuary cities'. (Mar 2008)",
    "Voted YES on comprehensive immigration reform. (Jun 2007)",
    "Voted NO on declaring English as the official language of the US government. (Jun 2007)",
    "Voted YES on eliminating the 'Y' nonimmigrant guestworker program. (May 2007)",
    "Voted YES on building a fence along the Mexican border. (Sep 2006)",
    "Voted YES on establishing a Guest Worker program. (May 2006)",
    "Voted YES on allowing illegal aliens to participate in Social Security. (May 2006)",
    "Voted NO on allowing more foreign workers into the US for farm work. (Jul 1998)",
    "Voted YES on visas for skilled workers. (May 1998)",
    "Voted NO on limit welfare for immigrants. (Jun 1997)",
    "Provide funding for social services for noncitizens. (May 2006)",
    "Rated 9% by USBC, indicating an open-border stance. (Dec 2006)",
    "Supports continued funding of sanctuary cities. (Sep 2010)",
    "Supports granting amnesty to illegal immigrants. (Sep 2010)",
    "Welcome 10,000 Syrian refugees now, and more later. (Sep 2015)",
    "Provide lawyers and evidence for children being deported. (Mar 2016)" ]
    
    let jobsArray: [String] = ["TV ad: Fiorina fired thousands and moved their jobs to China. (Oct 2010)",
    "Voted YES on extending unemployment benefits from 39 weeks to 59 weeks. (Nov 2008)",
    "Voted YES on overriding presidential veto of Farm Bill. (Jun 2008)",
    "Voted NO on terminating legal challenges to English-only job rules. (Mar 2008)",
    "Voted YES on limiting farm subsidies to people earning under $750,000. (Dec 2007)",
    "Voted YES on restricting employer interference in union organizing. (Jun 2007)",
    "Voted YES on increasing minimum wage to $7.25. (Feb 2007)",
    "Voted YES on raising the minimum wage to $7.25 rather than $6.25. (Mar 2005)",
    "Voted NO on repealing Clinton's ergonomic rules on repetitive stress. (Mar 2001)",
    "Voted NO on killing an increase in the minimum wage. (Nov 1999)",
    "Voted NO on allowing workers to choose between overtime & comp-time. (May 1997)",
    "Voted YES on replacing farm price supports. (Feb 1996)",
    "Protect overtime pay protections. (Jun 2003)",
    "Rated 100% by the AFL-CIO, indicating a pro-union voting record. (Dec 2003)",
    "Allow an Air Traffic Controller's Union. (Jan 2006)",
    "Sponsored bill linking minimum wage to Congress' pay raises. (May 2006)",
    "Form unions by card-check instead of secret ballot. (Mar 2009)",
    "Raise the minimum wage to $10.10 per hour by 2016. (Jan 2014)",
    "Extend unemployment compensation during recession. (Jan 2008)",
    "Ban discriminatory compensation; allow 2 years to sue. (Jan 2009)",
    "Stronger enforcement against gender-based pay discrimination. (Jan 2009)" ]
    
    let principlesAndValuesArray: [String] = ["2005: Asked general to call her 'Senator' instead of 'Ma'am'. (Apr 2010)",
    "Voted with Democratic Party 94.9% of 312 votes. (Sep 2007)",
    "Voted YES on confirming of Sonia Sotomayor to Supreme Court. (Aug 2009)",
    "Voted NO on confirming Samuel Alito as Supreme Court Justice. (Jan 2006)",
    "Voted NO on confirming John Roberts for Chief Justice of the Supreme Court. (Sep 2005)",
    "Religious affiliation: Jewish. (Nov 2000)",
    "Profiled in 'Jews in American Politics'. (Jan 2001)" ]
    
    let socialSecurityArray: [String] = ["Voted NO on establishing reserve funds & pre-funding for Social Security. (Mar 2007)",
    "Voted NO on Social Security Lockbox & limiting national debt. (Apr 1999)",
    "Voted NO on allowing Roth IRAs for retirees. (May 1998)",
    "Voted NO on allowing personal retirement accounts. (Apr 1998)",
    "Voted NO on deducting Social Security payments on income taxes. (May 1996)",
    "Rated 90% by the ARA, indicating a pro-senior voting record. (Dec 2003)",
    "Reject privatization; don't raise the retirement age. (Aug 2010)",
    "Rated 98% by ARA, indicating a pro-Trust Fund stance. (Jan 2013)" ]
    
    let taxReturnArray: [String] = ["Voted YES on increasing tax rate for people earning over $1 million. (Mar 2008)",
    "Voted NO on allowing AMT reduction without budget offset. (Mar 2008)",
    "Voted NO on raising the Death Tax exemption to $5M from $1M. (Feb 2008)",
    "Voted NO on repealing the Alternative Minimum Tax. (Mar 2007)",
    "Voted NO on raising estate tax exemption to $5 million. (Mar 2007)",
    "Voted NO on supporting permanence of estate tax cuts. (Aug 2006)",
    "Voted NO on permanently repealing the `death tax`. (Jun 2006)",
    "Voted YES on $47B for military by repealing capital gains tax cut. (Feb 2006)",
    "Voted NO on retaining reduced taxes on capital gains & dividends. (Feb 2006)",
    "Voted NO on extending the tax cuts on capital gains and dividends. (Nov 2005)",
    "Voted NO on $350 billion in tax breaks over 11 years. (May 2003)",
    "Voted YES on reducing marriage penalty instead of cutting top tax rates. (May 2001)",
    "Voted YES on increasing tax deductions for college tuition. (May 2001)",
    "Voted NO on eliminating the 'marriage penalty'. (Jul 2000)",
    "Voted NO on across-the-board spending cut. (Oct 1999)",
    "Voted NO on requiring super-majority for raising taxes. (Apr 1998)",
    "Rated 16% by NTU, indicating a 'Big Spender' on tax votes. (Dec 2003)",
    "Rated 100% by the CTJ, indicating support of progressive taxation. (Dec 2006)",
    "Minimum tax rate of 30% for those earning over $1 million. (Mar 2012)" ]
    
    let technologyArray: [String] = ["Voted YES on authorizing states to collect Internet sales taxes. (May 2013)",
    "Voted YES on $23B instead of $4.9B for waterway infrastructure. (Nov 2007)",
    "Voted NO on restoring $550M in funding for Amtrak for 2007. (Mar 2006)",
    "Voted YES on disallowing FCC approval of larger media conglomerates. (Sep 2003)",
    "Voted YES on Internet sales tax moratorium. (Oct 1998)",
    "Voted YES on telecomm deregulation. (Feb 1996)",
    "Promote internet via Congressional Internet Caucus. (Jan 2001)",
    "Facilitate nationwide 2-1-1 phone line for human services. (Jan 2007)",
    "Require websites to police for copyrighted materials. (May 2011)",
    "Strengthen infrastructure, including rail, dams, & Internet. (Jan 2013)",
    "Apply copyright inheritance to same-sex couples. (Jan 2015)",
    "Ensure net neutrality: no corporate-tiered Internet. (Jan 2007)",
    "Overturn FCC approval of media consolidation. (Mar 2008)" ]
    
    let warAndPeaceArray: [String] = ["The price of war is in body bags and babies killed. (Jun 2012)",
    "Can get NATO into Iraq if we have a fresh start. (Aug 2004)",
    "Voted YES on redeploying non-essential US troops out of Iraq in 9 months. (Dec 2007)",
    "Voted NO on designating Iran's Revolutionary Guards as terrorists. (Sep 2007)",
    "Voted YES on redeploying US troops out of Iraq by March 2008. (Mar 2007)",
    "Voted YES on redeploying troops out of Iraq by July 2007. (Jun 2006)",
    "Voted YES on investigating contract awards in Iraq & Afghanistan. (Nov 2005)",
    "Voted YES on requiring on-budget funding for Iraq, not emergency funding. (Apr 2005)",
    "Voted NO on $86 billion for military operations in Iraq & Afghanistan. (Oct 2003)",
    "Voted NO on authorizing use of military force against Iraq. (Oct 2002)",
    "Voted YES on allowing all necessary force in Kosovo. (May 1999)",
    "Voted YES on authorizing air strikes in Kosovo. (Mar 1999)",
    "Voted YES on ending the Bosnian arms embargo. (Jul 1995)",
    "Condemns anti-Muslim bigotry in name of anti-terrorism. (Oct 2001)",
    "Supports timetable for troop withdrawal from Afghanistan. (Sep 2010)",
    "Iranian nuclear weapons: prevention instead of containment. (Sep 2012)",
    "Sanctions on Iran to end nuclear program. (Apr 2009)",
    "Move the US Embassy to Jerusalem. (Nov 1995)" ]
    
    let welfareAndPovertyArray: [String] = ["Voted YES on instituting National Service as a new social invention. (Mar 2009)",
    "Voted NO on welfare block grants. (Aug 1996)",
    "Voted YES on eliminating block grants for food stamps. (Jul 1996)",
    "Voted NO on allowing state welfare waivers. (Jul 1996)",
    "Voted YES on welfare overhaul. (Sep 1995)",
    "Establish a National Affordable Housing Trust Fund. (Jul 2003)",
    "Fully fund AmeriCorps. (Jun 2003)" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        UserDefaults.standard.setValue(Issue.Abortion.rawValue, forKey: "issue")
        if let issue = UserDefaults.standard.value(forKey: "issue") as! String!{
            issueTextLabel.text = issue
            loadTheCorrectIssueData(issue: Issue(rawValue: issue)!)
        } else {
            issueTextLabel.text = "Abortion"
            loadTheCorrectIssueData(issue: Issue(rawValue: "Abortion")!)
        }
        
        politicianImageView.clipsToBounds = true
        politicianImageView.layer.cornerRadius = 50
    }
    
    
    func loadTheCorrectIssueData(issue: Issue) {
        
        switch issue{
        case .Abortion:
            stanceInfo = abortionStanceArray
            break
        case .BudgetAndEconomy:
            stanceInfo = budgetAndEconArray
            break
        case .CivilRights:
            stanceInfo = civilRightsArray
            break
        case .Corporations:
            stanceInfo = corporationArray
            break
        case .Crime:
            stanceInfo = crimeArray
            break
        case .Drugs:
            stanceInfo = drugsArray
            break
        case .Education:
            stanceInfo = educationArray
            break
        case .EnergyAndOil:
            stanceInfo = energyAndOilArray
            break
        case .Environment:
            stanceInfo = environmentArray
            break
        case .FamiliesAndChildren:
            stanceInfo = familiesAndChildrenArray
            break
        case .ForiegnPolicy:
            stanceInfo = foreignPolicyArray
            break
        case .FreeTrade:
            stanceInfo = freeTradeArray
            break
        case .GovernmentReform:
            stanceInfo = governmentReform
            break
        case .GunControl:
            stanceInfo = gunControlArray
            break
        case .HealthCare:
            stanceInfo = healthCareArray
            break
        case .HomelandSecurity:
            stanceInfo = homelandSecurityArray
            break
        case .Immigration:
            stanceInfo = immigrationArray
            break
        case .Jobs:
            stanceInfo = jobsArray
            break
        case .PrinciplesAndValues:
            stanceInfo = principlesAndValuesArray
            break
        case .SocialSecurity:
            stanceInfo = socialSecurityArray
            break
        case .TaxReform:
            stanceInfo = taxReturnArray
            break
        case .Technology:
            stanceInfo = technologyArray
            break
        case .WarAndPeace:
            stanceInfo = warAndPeaceArray
            break
        case .WelfareAndPoverty:
            stanceInfo = welfareAndPovertyArray
            break
        }
        tableView.reloadData()
    }
    
    @IBAction func changeIssueButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showIssueTableView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stanceInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stanceInfo[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
