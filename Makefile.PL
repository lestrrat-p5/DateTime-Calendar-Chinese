use inc::Module::Install;

name 'DateTime-Calendar-Chinese';
all_from 'lib/DateTime/Calendar/Chinese.pm';

requires 'DateTime::Event::Chinese', '0.99000';

author_tests 'xt';
WriteAll;