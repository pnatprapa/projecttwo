-- Create Users
COPY users (id, first_name, last_name, email, div, dep, username, password, enc_pass, salt) 
FROM stdin;
1	divisionhead	one	div1head@email.com	div1	div1	div1head	\n	12e6d7b9e7db8a26e0dd0e6f7c92aaf4739463f2501280666f8c5a7444361172	414ca72baf1dfe9705b697fbfea7cccd9ee1c5cf21ce58b29ca8aa7a221a1a51
2	divisionhead	two	div2head@email.com	div2	div2	div2head	\n	e268f94fb094585992d6704930d177b0f56edac372058d3a613676cfe669dfa2	f3a8d091ecc1ba5ce7f1716dfb3fca65a5ae944895c79ff18c290f3bb25584d7
3	steve	jobs	stjobs@email.com	div1	dep1	sjobs	\n	b86fad370c3bd57ccf1b19aedebaeb2832b9eb36d81374704fafdf1483dc90d4	f3899983a849ae2aeace734ae110e1945529057ef10daad7508eb0bc85731a7a
4	bill	gates	bigates@email.com	div1	dep2	bgates	\n	c94236435c5fc626d3f9ea6f6c49dfb020e779414c5f9e1502addd83511f6877	1919fbaba502fcddf1a352b66072a1f3616b1102ae5d1302fd0b288aeb296c95
5	john	doe	jodoe@email.com	div2	dep1	jdoe	\n	26e78dc4b97849aa0004b37bbea41d580cbaaa8048705c0f27a5d6d29ed2f129	cf44f430a7ce1bca40941399721ce8d41a9437f7adcaad4a113a02f2a9f2a38e
6	jane	doe	jadoe@email.com	div2	dep2	jadoe	\n	bf92fbb7e6e36d7bc525f05fa85584df042842f347a3864c29f66f0945432594	4b372db6ea15812df4544185e3a009366920a5d03475ae36d7e9f1af17d41c2e
\.

-- Create Suggestions

COPY suggestions (id, text, created_at, updated_at) 
FROM stdin;
1	This is jane doe	2011-03-10 21:28:32.458976	2011-03-10 21:28:32.458976
2	This is john doe	2011-03-10 21:31:47.781386	2011-03-10 21:31:47.781386
3	This is bill gates	2011-03-10 21:32:59.971264	2011-03-10 21:32:59.971264
4	This is steve jobs	2011-03-10 21:35:10.842315	2011-03-10 21:35:10.842315
5	This is divisionhead two	2011-03-10 21:38:53.120546	2011-03-10 21:38:53.120546
6	This is divisionhead one	2011-03-10 21:40:36.865481	2011-03-10 21:40:36.865481
\.

-- Create user_suggestion pairs

COPY user_suggestion (user_id, suggestion_id) 
FROM stdin;
6	1
5	2
4	3
3	4
2	5
1	6
\.

