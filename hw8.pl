team(College, Lead, Language, Sponsor, Color).

ahead(T1, T2, Teams) :- append(_, [T1,T2|_], Teams).

teams(Teams) :-
	length(Teams, 5),

	ahead(team(_, _, _, _, blue), team(_, _, _, _, purple), Teams),			% 1
	ahead(team(_, _, _, _, orange), team(_, _, haskell, _, _), Teams),		% 2
	Teams = [_, _, team(_, _, _, ibm, _), _, _],							% 3
	ahead(team(_, _, python, _, _), team(_, _, _, _, blue), Teams),			% 4
	\+ Teams = [team(_, _, _, _, red), _, _, _, _],							% 5
	ahead(team(_, _, _, google, _), team(_, _, _, _, blue), Teams),		 	% 6
	ahead(team(_, _, haskell, _, _), team(_, _, javascript, _, _), Teams),	% 7
	Teams = [_, _, _, _, team(_, _, c_plus_pus, _, _)],						% 8

	member(team(sjsu, tammy, _, _, _), Teams),								% 1
	member(team(_, alex, java, _, _), Teams),								% 2
	member(team(_, justin, _, amazon, _), Teams),							% 3
	member(team(sjsu, _, _, facebook, _), Teams),							% 4
	member(team(foothill, _, _, ibm, _), Teams),							% 5
	member(team(_, nicole, _, google, _), Teams),							% 6
	member(team(foothill, _, javascript, _, _), Teams),						% 7
	member(team(uc_berkeley, _, _, _, orange), Teams),						% 8
	member(team(_, _, _, apple, red), Teams),								% 9
	member(team(uc_santa_cruz, _, _, _, purple), Teams),					% 10
	member(team(sjsu, _, _, _, blue), Teams),								% 11
	
	member(team(de_anza, _, _, _, _), Teams), % not mentioned before
	member(team(_, steven, _, _, _), Teams). % not mentioned before


winners(First, Second) :- teams(Teams), Teams = [First, Second, _, _, _ ].
solution(Results) :- teams(Results).
