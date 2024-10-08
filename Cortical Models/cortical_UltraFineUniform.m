function out = model
%
% cortical_UltraFineUniform.m
%
% Model exported on Oct 8 2024, 15:05 by COMSOL 6.2.0.290.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('G:\Mi unidad\Doctorado\Electrodos\Interferential\Cortical stim');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('ec', 'ConductiveMedia', 'geom1');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').setSolveFor('/physics/ec', true);

model.label('UNSOLVED_30112023_small_electrode.mph');

model.param.set('z_pia_height', '0.02 [mm]');
model.param.descr('z_pia_height', 'z pia mater and arachnoid thickness (depth)');
model.param.set('z_gm_height', '2 [mm]');
model.param.descr('z_gm_height', 'z Grey matter thickness (z height)');
model.param.set('z_wm_height', '15 [mm]');
model.param.descr('z_wm_height', 'z White matter thickness (height)');
model.param.set('z_total_brain_height', 'z_pia_height + z_gm_height + z_wm_height');
model.param.descr('z_total_brain_height', '');
model.param.set('x_brain_width', '20 [mm]');
model.param.descr('x_brain_width', '');
model.param.set('y_brain_depth', 'x_brain_width');
model.param.descr('y_brain_depth', '');
model.param.set('e_height', '0.25 [mm]');
model.param.descr('e_height', 'Outer and inner electrode height');
model.param.set('e_outer_radius', '0.75 [mm]');
model.param.descr('e_outer_radius', 'outer electrode radius');
model.param.set('e_distance', '0.25 [mm]');
model.param.descr('e_distance', 'distance from centre');
model.param.set('current', '1 [mA]');
model.param.descr('current', '');

model.component('comp1').geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', {'x_brain_width' '1' '1'});
model.component('comp1').geom('geom1').feature('blk1').setIndex('size', 'y_brain_depth', 1);
model.component('comp1').geom('geom1').feature('blk1').setIndex('size', 'z_pia_height', 2);
model.component('comp1').geom('geom1').feature('blk1').set('base', 'center');
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').feature('blk1').label('Pia');
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').create('blk2', 'Block');
model.component('comp1').geom('geom1').feature('blk2').label('Grey matter');
model.component('comp1').geom('geom1').feature('blk2').set('size', {'x_brain_width' '1' '1'});
model.component('comp1').geom('geom1').feature('blk2').setIndex('size', 'y_brain_depth', 1);
model.component('comp1').geom('geom1').feature('blk2').setIndex('size', 'z_gm_height', 2);
model.component('comp1').geom('geom1').feature('blk2').set('base', 'center');
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').feature('blk2').set('pos', {'0' '0' '- 0.5 * z_gm_height'});
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('blk2');
model.component('comp1').geom('geom1').create('blk3', 'Block');
model.component('comp1').geom('geom1').feature('blk3').label('White matter');
model.component('comp1').geom('geom1').feature('blk3').set('size', {'1' '1' 'z_wm_height'});
model.component('comp1').geom('geom1').feature('blk3').set('base', 'center');
model.component('comp1').geom('geom1').feature('blk3').setIndex('size', 'y_brain_depth', 1);
model.component('comp1').geom('geom1').feature('blk3').setIndex('size', 'x_brain_width', 0);
model.component('comp1').geom('geom1').feature('blk3').set('pos', {'0' '0' '- z_gm_height - 0.5 * z_wm_height'});
model.component('comp1').geom('geom1').run('blk3');
model.component('comp1').geom('geom1').run('blk3');
model.component('comp1').geom('geom1').create('cyl1', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl1').label('Anode');
model.component('comp1').geom('geom1').feature('cyl1').set('r', 'e_outer_radius / 2');
model.component('comp1').geom('geom1').feature('cyl1').set('h', 'e_height');
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'-e_outer_radius - 0.25 [mm]' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');

model.param.set('e_distance', '0.20 [mm]');

model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'-e_outer_radius - e_distance' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').create('cyl2', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl2').label('Cathode');
model.component('comp1').geom('geom1').feature('cyl2').set('r', 'e_outer_radius / 2');
model.component('comp1').geom('geom1').feature('cyl2').set('h', 'e_height');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius + e_distance' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius + (e_distance/2)' '0' '0'});
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'-e_outer_radius - (e_distance/2)' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius + (e_distance/4)' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'-e_outer_radius' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_distance' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'-e_distance' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius + e_distance / 5' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'- e_outer_radius - e_distance / 5' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius/2' '0' '0'});
model.component('comp1').geom('geom1').run('cyl2');
model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'- e_outer_radius /2' '0' '0'});
model.component('comp1').geom('geom1').run('cyl1');
model.component('comp1').geom('geom1').run('cyl2');

model.param.set('e_distance', '0.05 [mm]');

model.component('comp1').geom('geom1').feature('cyl1').set('pos', {'- e_outer_radius /2 - e_distance' '0' '0'});
model.component('comp1').geom('geom1').feature('cyl2').set('pos', {'e_outer_radius/2 +  e_distance' '0' '0'});
model.component('comp1').geom('geom1').runPre('fin');

model.param.set('e_distance', '0.1[mm]');

model.component('comp1').geom('geom1').run('fin');

model.param.set('e_distance', '0.2[mm]');

model.component('comp1').geom('geom1').run('fin');

model.param.set('e_distance', '0.1[mm]');

model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').label('Pia');
model.component('comp1').material('mat1').selection.set([4]);
model.component('comp1').material('mat1').propertyGroup('def').set('density', '');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', '');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'2.75E-2'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'4.07E+7'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', {'1045'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', {'3696[J/kg/degC]'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'0.55[W/m/degC]'});
model.component('comp1').material.duplicate('mat2', 'mat1');
model.component('comp1').material('mat2').label('Grey matter');
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').label('White matter');
model.component('comp1').material('mat3').propertyGroup('def').set('density', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'2.76E+7'});
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'0.083' '0.083' '0.6'});
model.component('comp1').material('mat3').propertyGroup('def').set('density', {'1041'});
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', {'3583[J/kg/degC]'});
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'0.48[W/m/degC]'});
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat4').label('Electrode');
model.component('comp1').material('mat4').label('Electrode - platinum');
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', '');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', {'9.3*10^6'});
model.component('comp1').material('mat2').selection.set([2]);
model.component('comp1').material('mat3').selection.set([1]);
model.component('comp1').material('mat4').selection.set([6 8]);
model.component('comp1').material('mat1').selection.set([7]);
model.component('comp1').material('mat1').selection.all;
model.component('comp1').material('mat1').selection.set([3 4 5 7]);

model.component('comp1').view('view1').set('transparency', true);

model.component('comp1').physics('ec').create('gnd1', 'Ground', 2);
model.component('comp1').physics('ec').feature('gnd1').selection.set([3]);
model.component('comp1').physics('ec').create('term1', 'DomainTerminal', 3);
model.component('comp1').physics('ec').feature('term1').selection.set([6]);
model.component('comp1').physics('ec').feature('term1').label('Anode');
model.component('comp1').physics('ec').feature('term1').set('I0', 'current');
model.component('comp1').physics('ec').create('term2', 'DomainTerminal', 3);
model.component('comp1').physics('ec').feature('term2').selection.set([8]);
model.component('comp1').physics('ec').feature('term2').label('cathode');
model.component('comp1').physics('ec').feature('term2').set('I0', '- current');

model.component('comp1').mesh('mesh1').create('ftet1', 'FreeTet');
model.component('comp1').mesh('mesh1').feature.remove('ftet1');
model.component('comp1').mesh('mesh1').feature('size').set('custom', true);
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 300);
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 15);
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 400);
model.component('comp1').mesh('mesh1').feature('size').set('hgrad', 1.3);
model.component('comp1').mesh('mesh1').feature('size').set('hcurve', 0.2);
model.component('comp1').mesh('mesh1').feature('size').set('hnarrow', 1);
model.component('comp1').mesh('mesh1').create('swe1', 'Sweep');
model.component('comp1').mesh('mesh1').feature.remove('swe1');
model.component('comp1').mesh('mesh1').create('ftet1', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('ftet1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet1').label('pia_grey_electrode');
model.component('comp1').mesh('mesh1').feature('ftet1').selection.geom('geom1');
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').selection.set([2 3 4 5 6 7 8]);

model.component('comp1').physics('ec').feature('term2').label('Cathode');

model.component('comp1').mesh('mesh1').create('ftet2', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('ftet2').label('white_matter');
model.component('comp1').mesh('mesh1').feature('ftet2').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hgradactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hcurveactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hnarrowactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 400);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 15);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hgrad', 1.3);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hcurve', 0.2);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').selection.set([1]);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('custom', false);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('custom', false);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hgradactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 15);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hcurveactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hnarrowactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmax', 600);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmin', 30);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hgradactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hcurveactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hnarrowactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').selection.set([1 6]);

model.component('comp1').physics('ec').feature('term1').selection.set([5 6]);
model.component('comp1').physics('ec').feature('term2').selection.set([7 8]);

model.component('comp1').material('mat4').selection.set([5 6 7 8]);
model.component('comp1').material('mat1').selection.set([3 4]);

model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').selection.set([1]);

model.label('UNSOLVED_30112023_small_electrode (1).mph');

model.component('comp1').geom('geom1').feature('blk2').set('pos', {'0' '0' '- 0.5 * z_gm_height-0.5*z_pia_height'});
model.component('comp1').geom('geom1').runPre('fin');

model.component('comp1').mesh('mesh1').run;

model.component('comp1').geom('geom1').feature('blk3').set('pos', {'0' '0' '- z_gm_height - 0.5 * z_wm_height-0.5*z_pia_height'});
model.component('comp1').geom('geom1').runPre('fin');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').label('Electric Potential (ec)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('showlegendsmaxmin', true);
model.result('pg1').set('data', 'dset1');
model.result('pg1').set('defaultPlotID', 'InterfaceComponents/PlotDefaults/icom2/pdef1/pcond2/pcond1/pcond2/pg1');
model.result('pg1').feature.create('vol1', 'Volume');
model.result('pg1').feature('vol1').set('showsolutionparams', 'on');
model.result('pg1').feature('vol1').set('solutionparams', 'parent');
model.result('pg1').feature('vol1').set('colortable', 'Dipole');
model.result('pg1').feature('vol1').set('showsolutionparams', 'on');
model.result('pg1').feature('vol1').set('data', 'parent');
model.result.create('pg2', 'PlotGroup3D');
model.result('pg2').label('Electric Field Norm (ec)');
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsmaxmin', true);
model.result('pg2').set('data', 'dset1');
model.result('pg2').set('defaultPlotID', 'InterfaceComponents/PlotDefaults/icom3/pdef1/pcond2/pcond1/pg1');
model.result('pg2').feature.create('mslc1', 'Multislice');
model.result('pg2').feature('mslc1').set('showsolutionparams', 'on');
model.result('pg2').feature('mslc1').set('solutionparams', 'parent');
model.result('pg2').feature('mslc1').set('expr', 'ec.normE');
model.result('pg2').feature('mslc1').set('multiplanexmethod', 'coord');
model.result('pg2').feature('mslc1').set('xcoord', 'ec.CPx');
model.result('pg2').feature('mslc1').set('multiplaneymethod', 'coord');
model.result('pg2').feature('mslc1').set('ycoord', 'ec.CPy');
model.result('pg2').feature('mslc1').set('multiplanezmethod', 'coord');
model.result('pg2').feature('mslc1').set('zcoord', 'ec.CPz');
model.result('pg2').feature('mslc1').set('colortable', 'Prism');
model.result('pg2').feature('mslc1').set('colortabletrans', 'nonlinear');
model.result('pg2').feature('mslc1').set('colorcalibration', -0.8);
model.result('pg2').feature('mslc1').set('showsolutionparams', 'on');
model.result('pg2').feature('mslc1').set('data', 'parent');
model.result('pg2').feature.create('strmsl1', 'StreamlineMultislice');
model.result('pg2').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg2').feature('strmsl1').set('solutionparams', 'parent');
model.result('pg2').feature('strmsl1').set('expr', {'ec.Ex' 'ec.Ey' 'ec.Ez'});
model.result('pg2').feature('strmsl1').set('multiplanexmethod', 'coord');
model.result('pg2').feature('strmsl1').set('xcoord', 'ec.CPx');
model.result('pg2').feature('strmsl1').set('multiplaneymethod', 'coord');
model.result('pg2').feature('strmsl1').set('ycoord', 'ec.CPy');
model.result('pg2').feature('strmsl1').set('multiplanezmethod', 'coord');
model.result('pg2').feature('strmsl1').set('zcoord', 'ec.CPz');
model.result('pg2').feature('strmsl1').set('titletype', 'none');
model.result('pg2').feature('strmsl1').set('posmethod', 'uniform');
model.result('pg2').feature('strmsl1').set('udist', 0.02);
model.result('pg2').feature('strmsl1').set('maxlen', 0.4);
model.result('pg2').feature('strmsl1').set('maxtime', Inf);
model.result('pg2').feature('strmsl1').set('inheritcolor', false);
model.result('pg2').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg2').feature('strmsl1').set('maxtime', Inf);
model.result('pg2').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg2').feature('strmsl1').set('maxtime', Inf);
model.result('pg2').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg2').feature('strmsl1').set('maxtime', Inf);
model.result('pg2').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg2').feature('strmsl1').set('maxtime', Inf);
model.result('pg2').feature('strmsl1').set('data', 'parent');
model.result('pg2').feature('strmsl1').set('inheritplot', 'mslc1');
model.result('pg2').feature('strmsl1').feature.create('col1', 'Color');
model.result('pg2').feature('strmsl1').feature('col1').set('expr', 'ec.normE');
model.result('pg2').feature('strmsl1').feature('col1').set('colortable', 'PrismDark');
model.result('pg2').feature('strmsl1').feature('col1').set('colorlegend', false);
model.result('pg2').feature('strmsl1').feature('col1').set('colortabletrans', 'nonlinear');
model.result('pg2').feature('strmsl1').feature('col1').set('colorcalibration', -0.8);
model.result('pg2').feature('strmsl1').feature.create('filt1', 'Filter');
model.result('pg2').feature('strmsl1').feature('filt1').set('expr', '!isScalingSystemDomain');

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', false);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hgradactive', false);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hcurveactive', false);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hnarrowactive', false);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hminactive', false);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hgradactive', false);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hcurveactive', false);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hnarrowactive', false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.component('comp1').mesh('mesh1').feature('ftet1').create('cr1', 'CornerRefinement');
model.component('comp1').mesh('mesh1').feature('ftet2').create('cr1', 'CornerRefinement');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.label('UNSOLVED_30112023_small_electrode (1).mph');

model.component('comp1').mesh('mesh1').feature('size').set('hmax', 800);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 600);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmax', 800);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;
model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.component('comp1').mesh('mesh1').feature('size').set('hmin', 100);
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 900);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 700);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmax', 900);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 500);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').create('slc1', 'Slice');
model.result('pg1').run;
model.result('pg1').feature('slc1').set('quickplane', 'zx');
model.result('pg1').run;
model.result('pg1').feature('slc1').set('quickynumber', 1);
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('size').set('hmin', 50);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 300);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 30);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('size').set('hmin', 20);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.component('comp1').mesh('mesh1').feature('size').set('hmin', 25);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmax', 700);
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 700);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.label('SOLVED_30112023_small_electrode.mph');

model.result('pg1').run;
model.result('pg1').run;
model.result.export.create('plot1', 'Plot');
model.result('pg1').feature('slc1').active(false);
model.result('pg1').feature('slc1').active(true);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature.remove('slc1');
model.result('pg1').run;
model.result.export('plot1').set('filename', 'SOLVED_30112023_small_electrode.txt');
model.result.export('plot1').set('header', false);
model.result.export('plot1').set('sort', true);
model.result.export('plot1').run;

model.label('SOLVED_30112023_small_electrode.mph');

model.result.create('pg3', 'PlotGroup3D');
model.result('pg3').run;
model.result('pg3').create('vol1', 'Volume');
model.result('pg3').feature('vol1').set('expr', 'Vxx+Vyy+Vzz');
model.result('pg3').run;
model.result('pg3').feature('vol1').set('rangecoloractive', true);
model.result('pg3').feature('vol1').set('rangedataactive', true);
model.result('pg3').feature('vol1').set('rangecolormin', 0);
model.result('pg3').feature('vol1').set('rangedatamin', 0);
model.result('pg3').feature('vol1').set('rangedatamax', '2000000000/2');
model.result('pg3').run;
model.result('pg3').feature('vol1').set('rangedatamin', 0);
model.result('pg3').feature('vol1').set('rangedatamax', 10000);
model.result('pg3').run;
model.result('pg3').feature('vol1').set('rangecolormax', 1000);
model.result('pg3').feature('vol1').set('rangedatamax', 1000);
model.result('pg3').run;
model.result('pg3').feature('vol1').set('rangecolormin', 100);
model.result('pg3').feature('vol1').set('rangedatamin', 100);
model.result('pg3').run;
model.result('pg3').feature('vol1').set('rangecolormax', 10000);
model.result('pg3').feature('vol1').set('rangedatamax', 10000);
model.result('pg3').run;

model.label('SOLVED_30112023_small_electrode.mph');

model.result('pg3').run;
model.result.export.create('data1', 'Data');
model.result.export('data1').setIndex('expr', 'V', 0);
model.result.export('data1').set('filename', 'small_electrode.txt');
model.result.export('data1').run;

model.label('SOLVED_30112023_small_electrode.mph');

model.study.remove('std1');

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').run;
model.result('pg1').create('vol1', 'Volume');
model.result('pg1').feature('vol1').set('expr', 'Vxx+Vyy+Vzz');
model.result('pg1').feature('vol1').set('rangecoloractive', true);
model.result('pg1').feature('vol1').set('rangecolormin', 100);
model.result('pg1').feature('vol1').set('rangedataactive', true);
model.result('pg1').feature('vol1').set('rangedatamin', 100);
model.result('pg1').feature('vol1').set('rangecolormax', 10000);
model.result('pg1').feature('vol1').set('rangedatamax', 10000);

model.label('MOD_small_electrode_bipolar.mph');

model.result.export.create('data1', 'Data');
model.result.export('data1').label('bipolar_small_electrode');
model.result.export('data1').set('filename', 'bipolar_small_electrode.txt');
model.result('pg1').run;
model.result('pg1').label('Activating Function');
model.result('pg1').run;
model.result('pg1').run;
model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').run;
model.result('pg2').label('2d Activating Function');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').setSolveFor('/physics/ec', true);

model.result.dataset.create('cpl1', 'CutPlane');
model.result.dataset('cpl1').label('Cross Section');
model.result.dataset('cpl1').label('Cross Section XZ');
model.result.dataset('cpl1').set('quickplane', 'xz');
model.result.dataset.create('cpl2', 'CutPlane');
model.result.dataset('cpl2').label('Cross Section YZ');
model.result('pg2').run;
model.result('pg2').label('2D Activating Function');
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').label('XZ Activating Function');
model.result('pg2').feature('surf1').set('expr', 'Vxx + Vzz');
model.result('pg2').feature('surf1').set('unit', 'V/m^2');
model.result('pg1').run;
model.result('pg1').feature('vol1').label('Arial View Volume');
model.result('pg1').run;
model.result('pg1').label('3D Activating Function');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').create('surf2', 'Surface');
model.result('pg2').feature('surf2').label('YZ Activating Function');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('surf2').set('expr', 'Vyy + Vzz');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('surf2').set('unit', 'V/m^2');
model.result('pg2').run;
model.result('pg2').feature('surf1').label('XZ_Activating_Function');
model.result('pg2').run;
model.result('pg2').feature('surf2').label('YZ_Activating_Function');
model.result('pg1').run;
model.result('pg1').feature('vol1').label('Arial _View_Volume');
model.result('pg2').run;

model.label('template_small_electrode_bipolar.mph');

model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('surf1').set('data', 'cpl1');
model.result('pg2').run;
model.result('pg2').feature('surf2').set('data', 'cpl2');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;

model.param.set('e_outer_radius', '1 [mm]');
model.param.set('e_distance', '0.2 [mm]');
model.param.set('e_outer_radius', '1.5 [mm]');
model.param.set('e_distance', '0.3 [mm]');

model.component('comp1').geom('geom1').run('fin');

model.label('1_5_largest_electrode_bipolar (1).mph');

model.component('comp1').mesh('mesh1').feature.remove('ftet1');
model.component('comp1').mesh('mesh1').feature.remove('ftet2');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('coarseningmethod', 'classic');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result.create('pg3', 'PlotGroup3D');
model.result('pg3').label('Electric Potential (ec)');
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('showlegendsmaxmin', true);
model.result('pg3').set('data', 'dset1');
model.result('pg3').set('defaultPlotID', 'InterfaceComponents/PlotDefaults/icom2/pdef1/pcond2/pcond1/pcond2/pg1');
model.result('pg3').feature.create('vol1', 'Volume');
model.result('pg3').feature('vol1').set('showsolutionparams', 'on');
model.result('pg3').feature('vol1').set('solutionparams', 'parent');
model.result('pg3').feature('vol1').set('colortable', 'Dipole');
model.result('pg3').feature('vol1').set('showsolutionparams', 'on');
model.result('pg3').feature('vol1').set('data', 'parent');
model.result.create('pg4', 'PlotGroup3D');
model.result('pg4').label('Electric Field Norm (ec)');
model.result('pg4').set('frametype', 'spatial');
model.result('pg4').set('showlegendsmaxmin', true);
model.result('pg4').set('data', 'dset1');
model.result('pg4').set('defaultPlotID', 'InterfaceComponents/PlotDefaults/icom3/pdef1/pcond2/pcond1/pg1');
model.result('pg4').feature.create('mslc1', 'Multislice');
model.result('pg4').feature('mslc1').set('showsolutionparams', 'on');
model.result('pg4').feature('mslc1').set('solutionparams', 'parent');
model.result('pg4').feature('mslc1').set('expr', 'ec.normE');
model.result('pg4').feature('mslc1').set('multiplanexmethod', 'coord');
model.result('pg4').feature('mslc1').set('xcoord', 'ec.CPx');
model.result('pg4').feature('mslc1').set('multiplaneymethod', 'coord');
model.result('pg4').feature('mslc1').set('ycoord', 'ec.CPy');
model.result('pg4').feature('mslc1').set('multiplanezmethod', 'coord');
model.result('pg4').feature('mslc1').set('zcoord', 'ec.CPz');
model.result('pg4').feature('mslc1').set('colortable', 'Prism');
model.result('pg4').feature('mslc1').set('colortabletrans', 'nonlinear');
model.result('pg4').feature('mslc1').set('colorcalibration', -0.8);
model.result('pg4').feature('mslc1').set('showsolutionparams', 'on');
model.result('pg4').feature('mslc1').set('data', 'parent');
model.result('pg4').feature.create('strmsl1', 'StreamlineMultislice');
model.result('pg4').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg4').feature('strmsl1').set('solutionparams', 'parent');
model.result('pg4').feature('strmsl1').set('expr', {'ec.Ex' 'ec.Ey' 'ec.Ez'});
model.result('pg4').feature('strmsl1').set('multiplanexmethod', 'coord');
model.result('pg4').feature('strmsl1').set('xcoord', 'ec.CPx');
model.result('pg4').feature('strmsl1').set('multiplaneymethod', 'coord');
model.result('pg4').feature('strmsl1').set('ycoord', 'ec.CPy');
model.result('pg4').feature('strmsl1').set('multiplanezmethod', 'coord');
model.result('pg4').feature('strmsl1').set('zcoord', 'ec.CPz');
model.result('pg4').feature('strmsl1').set('titletype', 'none');
model.result('pg4').feature('strmsl1').set('posmethod', 'uniform');
model.result('pg4').feature('strmsl1').set('udist', 0.02);
model.result('pg4').feature('strmsl1').set('maxlen', 0.4);
model.result('pg4').feature('strmsl1').set('maxtime', Inf);
model.result('pg4').feature('strmsl1').set('inheritcolor', false);
model.result('pg4').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg4').feature('strmsl1').set('maxtime', Inf);
model.result('pg4').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg4').feature('strmsl1').set('maxtime', Inf);
model.result('pg4').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg4').feature('strmsl1').set('maxtime', Inf);
model.result('pg4').feature('strmsl1').set('showsolutionparams', 'on');
model.result('pg4').feature('strmsl1').set('maxtime', Inf);
model.result('pg4').feature('strmsl1').set('data', 'parent');
model.result('pg4').feature('strmsl1').set('inheritplot', 'mslc1');
model.result('pg4').feature('strmsl1').feature.create('col1', 'Color');
model.result('pg4').feature('strmsl1').feature('col1').set('expr', 'ec.normE');
model.result('pg4').feature('strmsl1').feature('col1').set('colortable', 'PrismDark');
model.result('pg4').feature('strmsl1').feature('col1').set('colorlegend', false);
model.result('pg4').feature('strmsl1').feature('col1').set('colortabletrans', 'nonlinear');
model.result('pg4').feature('strmsl1').feature('col1').set('colorcalibration', -0.8);
model.result('pg4').feature('strmsl1').feature.create('filt1', 'Filter');
model.result('pg4').feature('strmsl1').feature('filt1').set('expr', '!isScalingSystemDomain');
model.result('pg3').run;

model.label('1_5_largest_electrode_bipolar (1).mph');

model.result('pg3').run;
model.result.dataset.create('cln1', 'CutLine3D');
model.result.dataset('cln1').setIndex('genpoints', 0, 1, 0);
model.result.dataset('cln1').setIndex('genpoints', -5000, 1, 2);
model.result('pg4').run;
model.result.create('pg5', 'PlotGroup1D');
model.result('pg5').run;
model.result('pg5').create('lngr1', 'LineGraph');
model.result('pg5').feature('lngr1').set('markerpos', 'datapoints');
model.result('pg5').feature('lngr1').set('linewidth', 'preference');
model.result('pg5').run;
model.result('pg5').set('data', 'cln1');
model.result('pg5').label('Potential');
model.result('pg5').run;
model.result('pg5').run;
model.result.duplicate('pg6', 'pg5');
model.result('pg6').run;
model.result.duplicate('pg7', 'pg6');
model.result('pg7').run;
model.result('pg6').run;
model.result('pg6').label('Electric Field');
model.result('pg7').run;
model.result('pg7').label('Activating Function');
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').feature('lngr1').set('expr', 'Vz');
model.result('pg6').run;
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('expr', 'Vzz');
model.result('pg7').run;
model.result('pg5').run;
model.result('pg6').run;
model.result('pg7').run;
model.result.dataset('cln1').label('Across');
model.result.dataset.duplicate('cln2', 'cln1');
model.result.dataset.duplicate('cln3', 'cln2');
model.result.dataset('cln2').label('Grey');
model.result.dataset('cln3').label('White');
model.result.dataset('cln2').setIndex('genpoints', -2000, 1, 2);
model.result.dataset('cln3').setIndex('genpoints', -2000, 0, 2);
model.result('pg5').run;
model.result('pg5').set('data', 'cln2');
model.result('pg5').run;
model.result('pg6').run;
model.result('pg6').set('data', 'cln2');
model.result('pg7').run;
model.result('pg7').set('data', 'cln2');
model.result('pg6').run;
model.result('pg7').run;

model.label('UniqueMesh_bipolar.mph');

model.result('pg7').run;
model.result('pg7').run;
model.result('pg7').run;
model.result('pg5').run;
model.result('pg5').set('data', 'cln1');
model.result('pg6').run;
model.result('pg6').set('data', 'cln1');
model.result('pg7').run;
model.result('pg7').set('data', 'cln1');
model.result.export.create('plot1', 'Plot');
model.result.export('plot1').set('filename', '300_700_bipolar_EP.txt');
model.result.export('plot1').set('plotgroup', 'pg5');
model.result.export('plot1').set('filename', 'unique_bipolar_EP.txt');
model.result.export('plot1').run;
model.result.export.duplicate('plot2', 'plot1');
model.result.export.duplicate('plot3', 'plot2');
model.result.export('plot2').set('plotgroup', 'pg6');
model.result.export('plot2').set('filename', 'unique_bipolar_EF.txt');
model.result.export('plot3').set('plotgroup', 'pg7');
model.result.export('plot3').set('filename', 'unique_bipolar_AF.txt');
model.result.export('plot2').run;
model.result.export('plot3').run;

model.label('UniqueMesh_bipolar.mph');

out = model;
