function nut_close
% --- Executes during object deletion, before destroying properties.

global st rivets corrs nuts

try  % close SPM window if open
    delete(st.fig);
end
try  % close nut_results_viewer if open
    delete(rivets.fig)
end
try  % close FCM correlation window if open
    delete(corrs.fig)
end
clear global rivets corrs       % we could clear st here as well, but then it takes longer to get SPM8 loaded again when reopening NUTMEG
closereq
if isfield(nuts,'fig')
  nuts =  rmfield(nuts,'fig');
end

message = { 'Okay, buh-bye.'
            'And after many glasses of work\nI get paid in the brain.\n\n-Your Own Worst Enemy, by They Might Be Giants'
            'Though it may not be a long way off\nI won''t be done until my head falls off.\n\n-They Might Be Giants'
            'Thank you. Come again.'
            'I can''t see your face in my mind.\n\n-The Doors'
            'Gone nuts.  Will return in five minutes.'
            'Sure, to you she''s just a set of intercorrelated coordinates... what fun is that?! \n\n-Kronos: Ravager of Planets'
            'You can check your anatomy all you want, and even though there may be normal\nvariation, when you get right down to it, this far inside the head it\naaaaaallll looks the same.\n\nNo no no no no, don''t tug on that, you never know what it might be attached to!\n\n-Buckaroo Banzai\n Banzai Institute for Biomedical Engineering and Strategic Information'
            'Hypothalamus, hypothalamus, hypothalamus...\nThat''s the brain for me!\n\n-The Rhapsody of Tuli, by the Fugs'
            'Then they waved this wand all ''round my head\nsaid now we''re readin'' your brain, you see\nYou got an awful lot of songs in there\nthough it seems like they''re all in the key of G\n[...]\nThey said how come you don''t play the harmonica more?\nI said how come I''m in a spaceship, talkin'' to aliens about my act?!\nThey said we''d rather talk physics,\nbut you''re illiterate there...\n\nI couldn''t argue...\n\n-Talkin'' Alien Abduction Blues, by Dan Bern'
            'I thought I''d take a chance,\nAnd forgot about the States...\nYeah, I thought I''d gravitate\nTo the hills of central France.\n\n-Massif Centrale, Frank Black and the Catholics'
            'Put me in the hospital for nerves and then they had to *commit* me...\n\nFlagpole Sitta, by Harvey Danger'
            'And the movement in your brain\nSends you out into the rain...\n\n-Things Behind the Sun, by Nick Drake'
            'Get back, LORETA! :) \n\n-The Beatles'
            'Rip that mainframe\nI''ll explain\nA [nutmeg] like me is goin'' insane...\n\nInsane in the membrane...\nInsane in the brain!\nInsane in the membrane...\nCrazy insane... got no brain!\n\n-Cypress Hill'
            'Allow me to surf on your brain waves with jet skis.\n\n-Battle for Asgard, by Cannibal Ox'
            'Does the mind rule the body,\nOr does the mind rule the body?\nI dunno.\n\n-Still Ill, by the Smiths'
            'Filmmaking is the act of trying to put your dreams on a flat screen outside of your brain.\n\n-Gaspar Noe'
            'Um yeah, did you get that memo?  Please submit your TPS report on Nutmeg ASAP. \nThat would be greaaaat.  And don''t forget the cover sheet. Thaaanks.'
            'Goodbye, cruel world.'
            'I''d rather have a bottle in front of me than a frontal lobotomy.\n\n-Tom Waits'
            'Homer: I want you to stick this crayon into my brain.\nMoe: Ah, the old "crayola oblongata," eh?\n\n-The Simpsons'
            'In his halls he often wandered\nWith the secrets of the world.\nAnd his subjects gathered round him\nLike the leaves around a tree...\n\n-Cortez the Killer, by Neil Young'
            'Supersonic waves combine and burn as brainwaves.\n\n-Blue Flowers, by Dr. Octagon'
            'With your feet in the air and your head on the ground...\nTry this trick and spin it. Yeah!\nYour head will collapse\nIf there''s nothing in it\nAnd you''ll ask yourself...\nWhere is my mind?\n\n-Where is my Mind? by the Pixies'
            'Oh, you''ll be back.'
            'California''s all right...\nSomebody check my brain!\n\n-Check my Brain, by Alice in Chains'
            'I got a head full of ideas\nThat are driving me insane!\n\n-Maggie''s Farm, by Bob Dylan'
            'The hand is the most wonderful instrument ever created, but it cannot act of\nits own accord; it is the servant of the brain. (Author''s note: Well, that''s\nthe brain''s story anyhow.)\n\n-Even Cowgirls Get the Blues, by Tom Robbins'
            'I saw so much I broke my mind.\n\n-Just Dropped In (To See What Condition my Condition is In)'
            'It is not a brain. The brain, that pound and a half of chicken-colored goo so\nhighly regarded (by the brain itself), that slimy organ to which is attributed\nsuch intricate and mysterious powers (it is the same brain that does the\nattributing), the brain is so weak that, without its protective casing to\nsupport it, it simply collapses of its own weight. So it could not be a brain.\n\n-Even Cowgirls Get the Blues, by Tom Robbins'
            'Marge: Oh, that''s the babysitter.  No one in town will sit for you two\nanymore! I had to choose between a grad student at the university\nand a scary-looking hobo.\nBart: Please the hobo, please the hobo, please the hobo...\n\n-The Simpsons'
            'No food for you grad students until you grade 3000 papers!\n\n-The Simpsons'
            'I got the deaf people hearing this,\nblind people seeing this\nParalyzed from the neck down still feeling this.\n\nExact, by Benefit'
            'There is a general place in your brain, I think, reserved for "melancholy of\nrelationships past." It grows and prospers as life progresses, forcing\nyou finally, against your grain, to listen to country music. \n\n-Kary Mullis, Nobel Prize acceptance speech'
            'I want to ask you fellows --\nWhy do you shut me out,\nWhen I''ve driven every place that they call land???\nI talk plain talk.\nI''ve seen the moon sitting on the road...\nAnd I don''t eat no Chateaubriand!!!\n\n-Pure Denizen of the Citizen''s Band, by Frank Black'
            'Paralyze your cerebellum, throw your reality out of alignment.\n\n-Pack Up, by Lyrics Born'
            'Now, what y''all wanna do?\nWanna be hackers? Code crackers? Slackers?\nWastin'' time with all the chatroom yakkers?\n9 to 5, chillin'' at Hewlett Packard?\n\n''It''s All about the Pentiums'' by Weird Al Yankovic'
            'Effect without a cause\nSubatomic laws, scientific pause\nSynchronicity!\n\n-The Police'
            'Only shred of evidence is the virtual file\nStored within the cerebellum...\nHit you Berkowitz style!\n\nUpgrade, by Deltron 3030'
            'And out in the distance\nA trick of the brain\nI see a lone rider\nCrossing the plain.\n\n-I Hung my Head, by Sting'
            'A connecting principle,\nLinked to the invisible\nAlmost imperceptible\nSomething inexpressible.\nScience insusceptible\nLogic so inflexible\nCausally connectible\nYet nothing is invincible.\n\n-Synchronicity I, by the Police'
            'I''m not sure... I''m afraid we need to use... MATH!\n\n-Professor Farnsworth, Futurama'
            'Can you help me\nOccupy my brain?\n\n-Paranoid, by Black Sabbath'
            'The eye receives the messages and sends it to the brain\nNo guarantee the stimuli must be perceived the same\nWhen looking through Gary Gilmore''s eyes!\n\nLooking Through Gary Gilmore''s Eyes, by the Adverts'
            'Finished with my woman\n''Cause she couldn''t help me with my mind.\n\n-Paranoid, by Black Sabbath'
            'I''m gonna take the organic brain dementia, ok? You can''t have the whole brain! \n\n-Jack, Fight Club'
            'I used to think the brain was the most important organ in the body,\nbut then I realized what was telling me that.\n\n-Emo Philips'
            'Something strange, in your neighborhood... who you gonna call... nutmeg!'
            'There is always an easy solution to every human problem -- neat, plausible, and wrong.\n\n-H.L. Mencken'
            'The beat goes on, the beat goes on\nDrums keep pounding a rhythm to the brain\nLa de da de de, la de da de da.\n\nThe Beat Goes On, by Sonny & Cher'
            'I can see right into my brain. You were right, man...\nEverything is in the head!\n\n-Peter Fonda in "The Trip."'
            'Cocaine''s for horses and it''s not for men\nDoctor say it''ll kill you but he don''t say when\nCocaine... all around my brain.\n\n-Cocaine Blues, by the Rev. Gary Davis'
            'You''ll all get played.... your brain''s inferior...\nI hit the lateral AND posterior!\n\n-Things You Can Do, by Deltron 3030'
            'There she goes,\nThere she goes again,\nRacing through my brain,\nAnd I just can''t contain\nThis feeling that remains.\n\n-There She Goes, by the La''s'
            'Couldn''t defrag my power density intensity.\n\n-Things You Can Do, by Deltron 3030'
            'Hiero''s like dipoles inside a silo.\n\n-Things You Can Do, by Deltron 3030'
            'And you wanna call your mother and say,\n"Mother, I can never come home again because\nI seem to have left an important part of my brain somewhere...\nSomewhere... in a field in Hampshire, all right?"\n\n-Sorted for E''s and Whizz, by Pulp'
            'The butler did it... in the dining room... with the nutmeg.'
            'Do I really even love you?\nOr do I really love your...\nbraaaain?\n\n-Brain, by N.E.R.D.'
            'Something tells me you can read my mind...\nYour brain is calling to me one more time.\n\n-Good, by Morphine'
            'I''m just another ten percenter...\nMy mind is like an ocean!\n\n-Ten Percenter, by Frank Black'
            'I might be small but my nuts are big!\n\n-Chuckie, by the Geto Boys'
            'This phone call concerns hippie Ernie,\nThat Woodstock brain, that acid face.\nYou walked by the computer center with... drugged out Ernie,\nAnd I''m calling to say I could take his place!\nNow, he''s a hippie... hippie Ernie...\nBut I''m straight! And I want to take his place!\n\n-I''m Straight, The Modern Lovers'
            'Brainwaves transmitted from my mind...\nOf a magnetic kind.\nI don''t know what to do\nIf I can''t get through to you...\nSo think!\n\n-E.S.P., by the Buzzcocks'
            'Is he alive or dead?\nHas he thoughts within his head?\n\n-Iron Man, by Black Sabbath'
            '"I''m killing your brain like a poisonous mushroom."\n\n-Ice Ice Baby, by Vanilla Ice'
            'Clap your ear with Soulsonic Mantronik Phonics\nTurn your brain into an omelette!\n\n-Positive Contact, by Deltron 3030'
            'The fusion of music and mind precipitates translucent illusions.\n\n-Positive Contact, by Deltron 3030'
            '"I got the skills of titanium, straight to the cranium."\n\n-Rock and Roll (Could Never Hip Hop Like This), by Handsome Boy Modeling School'
            'I went to the ship''s medical bay and plugged myself into the encephalographic\nscreen.\n[...]\nThen I tried superimposing the results from one head on top of the results\nfrom the other head. Still nothing.\n[...]\nLast thing I did before I packed it in was take the superimposed picture and\nlook at it through a green filter.\n[...]\nAnd there it was, clear as day. A whole section in the middle of both brains\nthat related only to each other and not to anything else around them.\n\n -Zaphod Beeblebrox, Hitchhiker''s Guide to the Galaxy'
            'Temptation starts its trail of electronic impulses through the channels\nof the brain...\n\n-The Burning of the Abominable House, by Italo Calvino'
            'I can''t prevent the slow tentacles of my mind from advancing one hypothesis\nat a time, exploring labyrinths of consequence that magnetic memories would\nrun through in a nanosecond.\n\n-The Burning of the Abominable House, by Italo Calvino'
            'Hey, yo, why are you so smooth?\nWhy am I smooth???\nBrain cells are overworked\nBut I refuse to blow a fuse.\n\n-Smoothness, Black Rob & Dan the Automator'
            'Watchful lines vibrate soft\nIn brainwave time\nSilver pictures move so slow\nGolden tubes faintly glow\n\nElectric faces seem to emerge\nHidden voices mock your words\nFade away and radiate\nFade away and radiate\n\nBeams become my dream\nMy dream is on the screen\n\n-Blondie (possibly under the influence of nutmeg?)'
            'I love your brain.\nIt''s a beautiful brain.\nWanna be with your brain.\nWanna sleep with your bra-a-a-a-in!\n\n-Frank Black and the Catholics'
            '"Upgrade your gray matter... cuz'' one day it may matter."\n\n-Upgrade, by Deltron 3030'
            'No matter how he tried,\nHe could not break free.\nAnd the worms ate into his brain.\n\n-Hey You, by Pink Floyd'
            '"There''s someone in my head... but it''s not me."\n\n-Brain Damage, by Pink Floyd'
            '"Nutmeg has been mentioned in Unani medicine to be of value \n in the management of male sexual disorders."\n Tajuddin et al. 2005 BMC'
            'Let''s get ill, that''s the deal.\nAt the gate, we''ll bring the bud top drill. (Just)\nLose your mind this is the time,\nYa''ll test this drill, Just and bang your spine. (Just)\nBob your head like epilepsy, up inside your club or in your bentley.\nGet messy, loud and sick.\nY''all mount past slow mo in another head trip. (So)\nCome then now do not correct it, let''s get ignant let''s get hectic. \n\nBlack Eyed Peas, "Let''s Get Retarded" '
            '"I know you can read my thoughts, boy. Meow, Meow, Meow, Meow, Meow,\nMeow, Meow, Meow, Meow, Meow, Meow."\n\n-Homer Simpson'
            'We''ll send him cheesy movies,\nThe worst we can find...\nHe''ll have to sit and watch them all,\nAnd we''ll monitor his mind...\n\n-Mystery Science Theatre 3000'
            'Can''t keep away from the girl\nThese two sides of my brain\nNeed to have a meeting.\nCan''t think of anything to do\nMy left brain knows that\nAll love is fleeting...\n\nFell in Love with a Girl, by the White Stripes'
            'Is my brain small enough\nFor you to make me a star?\n\n-Pull my Strings, by the Dead Kennedys'
            'I want a doctor to take your picture\nSo I can look at you from inside as well.\n\n-Turning Japanese, by The Vapors'
            'Rooney nutmegs Friedrich, passing the ball to Beckham. Goooooooaaal!'
            'The television screen is the retina of the mind''s eye...\nTherefore, the television screen is part of the physical structure of the brain.\nTherefore, whatever appears on the television screen emerges as raw experience for those who watch it.\nTherefore, television is reality... and reality is less than television.\n\n-Barry O''Blivion, Videodrome'
            'My little brother just discovered rock ''n'' roll\nThere''s noise in his head and he''s out of control!\n\nMy Little Brother, by Art Brut'
            'Proceeding to enscript the code\nThat makes your brain overload and implode.\n\n-Dune Methane, by the Hieroglyphics'
            '"Hello, my name is Inigo Montoya. You killed my\n [nutmeg]. Prepare to die."\n\n-Princess Bride, 1987'
            'Roll out that special head...\nThis is our favorite one.\n\n-Hall of Heads, by They Might Be Giants'
            'Impulses through my brain\nBut still the thoughts remain...\n-Optical Sound, by the Human Expression'
            '"If you put tomfoolery into a computer, nothing comes\nout of it but tomfoolery. But this tomfoolery, having\npassed through [nutmeg], is somehow ennobled and no-one\ndares criticize it."\n\n-Pierre Gallois'
            'And I see through your brain\nLike I see through the water\nThat runs down my drain.\n\n-Masters of War, by Bob Dylan'
            'Now I guess I''ll have to tell ''em\nThat I got no cerebellum!\nGonna get my PhD...\nI''m a teenage lobotomy!\n\n-Teenage Lobotomy, by the Ramones'
            'Siam''s gonna be the witness\nTo the ultimate test of cerebral fitness.\n\n-One Night in Bangkok, by Murray Head'
            'You gotta put her at ease,\nWhether it''s shorties from the P''s\nOr they got PhDs!\n\n-Yoo-hoo!, by Jemini and Danger Mouse'
            'I don''t doubt that the president has passed many\ncognitive milestones, but, uh... \n\n-Jon Stewart'
            'Hold it, doc, a World War passed through my brain!\n\n-Talkin'' World War III Blues, by Bob Dylan'
            'Let him be. You want to waste Bellevue''s time and taxpayer''s money photographing the inside of that head?\n\n-Skinny Legs and All, by Tom Robbins'
            'Gracias a la vida que me ha dado tanto\nMe dio el coraz???n que agita su marco\nCuando iro el fruto del cerebro humano.\n\nGracias a la Vida, por Mercedes Sosa'
            'Okay, brain. You don''t like me, and I don''t like you,\nbut let''s get through this thing and then I can continue\nkilling you with beer.\n\n-Homer Simpson'
            'No more leaky holes in your brain\nAnd no false starts...\nI wanna get out\nAnd make it work...\n\n-Atoms for Peace, by Thom Yorke'
            'Bart: Look at me, I''m a grad student! I''m 30 and I made $600 last year!\nMarge: Bart, don''t make fun of grad students -- they''ve just made a\nterrible life choice.'
            'What''s the deal with my brain?\n\n-Perfect Situation, by Weezer'
            'My poor brain is gonna pop.\n\n-Peace, by Weezer'
            'Given enough time, a hypothetical chimpanzee typing at random would almost surely produce NUTMEG'
            'The probability of a monkey typing the complete NUTMEG package is non-zero'
            'First we coerce your brain patterns\nCollaborate with time consume and reprogram it.\n\n-Mastermind, by Deltron 3030'
            'Neural surgeon -- the purest virgin, conducting currents...\n\nMastermind, by Deltron 3030'
            'The Brain: Are you pondering what I''m pondering?\nPinky: Woof, oh, I''d have to say the odds of that are terribly slim, Brain.\nThe Brain: True.\nPinky: I mean, really, when have I ever been pondering what you''ve been pondering?\nThe Brain: To my knowledge, never.\nPinky: Exactly. So, what are the chances that this time, I''m pondering what you''re pondering?\nThe Brain: Next to nil.\nPinky: Well, that''s exactly what I''m thinking, too.\nThe Brain: Therefore, you ARE pondering what I''m pondering.\nPinky: Poit, I guess I am.'
            'The Brain: Are you pondering what I''m pondering?\nPinky: Uh, I think so, Brain, but balancing a family and a career... oooh, it''s all too much for me.' 
            'The Brain: Sigmund Freud would have had a field day with you, Pinky.\nPinky: Ah, he liked sports then, did he?'
            'The Brain: Do you practice being dim or is it a natural talent?\nPinky: Oh practice Brain. All day, EVERYDAY!'
            'Pinky, you give a whole new meaning to the phrase, "counter-intelligence."\n You have the I.Q. of plaster.\n The Brain'
            'Please be sure to empty all metal from your pockets\nbefore entering the magnetometer. \n\nTSA, Chicago O''Hare International Airport'
            'Lump lingered last in line for brains\nAnd the ones she got were sorta rotten and insane\nSmall things so sad that birds could land\nIs lump fast asleep or rockin out with the band\n\nShe''s lump she''s lump\nShe''s in my head\nShe''s lump she''s lump she''s lump\nShe might be dead\n\nLump, Presidents of the United States of America'
            'I pack more heat in a computer chip than any man\nthere is more than most can handle\nthe trick is to protect the circuit and conduct the heat\nwithout causing to short circuit\n\nHot electrons can ruin my day\nSwitch the transistor to go the other way\nI make my software self healing\nTo prevent such a calamity from dealing\nA deadly blow to my directory root\nIf all else fails......YO. REBOOT\n\nSit back enjoy the ride\nComputer geeks have arrived\n\nEnjoy the Ride, Rajeev "GK" Bajaj'
            'Sex and drugs and rock n'' roll...\nAre all my brain and body need...\nSex and drugs and rock n''roll... Are very good indeed!\n\n-Ian Dury and the Blockheads'
            'My whole brain was out of tune\nI don''t know how to tune a brain do you?\nWent into a brain shop.\nThey said they''d have to rebuild the whole head.\nI said, "Well, do you what you gotta do."\nWhen I got my brain back\nDidn''t work right.\nDidn''t have as many good ideas.\nHaven''t really had a good idea since I got it fixed.\n\nMy Brain, by Morphine'
            'I am an Engineer\nRespect my mind\nSo bow down when u see me downtown\n\nGeek Dreams, Rajeev "GK" Bajaj'
            'Slowly, slowly, waves in my brain\nMy flesh is no more cold\nI''m in love... I''m in love.\n\nAquarius, by Laetitia Sheriff'
            'I made the calculator and computer too\n''cause math is not something everybody can do\nI made the internet to chat with my buddies\nand get some work done too..\n\nGeek Dreams, Rajeev "GK" Bajaj' 
            'The Original Suffolk Cannister for NUTMEG, by Henry Watson Pottery:\nIdeal Storage at Home or on Safari'
            '"When I was institutionalized, my brain was studied exhaustively by\nthe guys of mental health. I was interrogated, I was x-rayed, I was examined\n*thoroughly*. Then, they took everything about me and put it into a computer\nwhere they created this model of my mind. Yes! Using that model they managed\nto generate every thought I could possibly have in the next, say, 10 years.\nWhich they then filtered through a probability m-m-matrix of some kind to -- to\ndetermine everything I was gonna do in that period!"\n\nJeffrey Goines, played by Brad Pitt, in 12 Monkeys'
            '"[Nutmeg], I''m no good at being noble, but it doesn''t take\nmuch to see that the problems of three little [researchers]\ndon''t amount to a hill of beans in this crazy world. Some\nday you''ll understand that. Now, now ...  Here''s looking\nat you kid."\n\n-Blaine, Richard (Humphrey Bogart) in Casablanca, 1942'
            '"What''s done cannot be undone." (Shakespeare)  Unless you forgot to save.'
            'One is a genius\nThe other''s insane.\nThey''re laboratory mice\nTheir genes have been spliced\nThey''re dinky\nThey''re Pinky and The Brain, Brain, Brain, Brain'
            'Their twilight campaign\nIs easy to explain.\nTo prove their mousey worth\nThey''ll overthrow the Earth\nThey''re dinky\nThey''re Pinky and the Brain, Brain, Brain, Brain' 
            'I got bugs in my room\nTheir eggs in my head\n...\nAnd now the questions:\nDo I kill them?\nBecome their friend?\n\n-Bugs, by Pearl Jam'
            'DISCLAIMER:\n"Nutmeg causes hallucinations. Reported symptoms include euphoria,\n distortions of time and space, detachment from reality,\n sensation of loss of limbs, and fear of impending death."'
            'Did you know:\n"Nutmeg has also been used to treat madness and flatulence."\nAsk your doctor if nutmeg is right for you!'  };
            
fprintf('\n\n');
c=clock; 
warning('off','MATLAB:RandStream:ActivatingLegacyGenerators')
rand('seed',ceil((10*c(end)-fix(10*c(end)))*100));
warning('on','MATLAB:RandStream:ActivatingLegacyGenerators')
fprintf(message{ceil(rand*size(message,1))})
fprintf('\n\n');
