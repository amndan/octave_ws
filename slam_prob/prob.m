function res = prob(m, s)

	 phit = 0;
	 pphi = 0;
	 pshort = 0;
	 pmax = 0;
	 prand = 0;
   M_PI = pi;
   M_E = e;
   
	_zhit = 0.05;
	_zphi = 0.0;
	_zshort = 0.0;
	_zmax = 0.0;
	_zrand = 0.95;
	
	_rangemax = 20;
	_sigphi = M_PI / 180.0 * 3;
	_sighit = 0.2;
	_lamshort = 0.08;
	_maxAngleDiff = 3.0;
	_maxAnglePenalty = 0.5;
  
% _zhit = 0.45;
%	_zphi = 0.0;
%	_zshort = 0.25;
%	_zmax = 0.05;
%	_zrand = 0.25;
%	
%	_rangemax = 20;
%	_sigphi = M_PI / 180.0 * 3;
%	_sighit = 0.2;
%	_lamshort = 0.08;
%	_maxAngleDiff = 3.0;
%	_maxAnglePenalty = 0.5;

	#// hit
	if (s < _rangemax)
		phit = (1) / (sqrt(2 * M_PI * pow(_sighit, 2))) * pow(M_E, ((-0.5 * pow((m - s), 2)) / (pow(_sighit, 2)))) ;
	endif

	#// phi
	pphi = (1) / (sqrt(2 * M_PI * pow(_sigphi, 2))) * pow(M_E, ((-0.5 * pow(s, 2)) / (pow(_sigphi, 2)))) ;

	#// short
	if (s < m)
    n = (1)/(1 - pow(M_E, (-_lamshort * m)));
    pshort = n * _lamshort * pow(M_E, (-_lamshort * s)) ;
	endif

	#// max
	if (s >= _rangemax)
	  pmax = 1;
	endif

	#// rand
	if (s < _rangemax)
	  prand = 1 / _rangemax;
	endif

	res = _zhit * phit + _zshort * pshort + _zmax * pmax + _zrand * prand;

endfunction