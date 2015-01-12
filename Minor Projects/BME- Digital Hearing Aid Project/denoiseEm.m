function y = denoiseEm(x);

[thr,sorh,keepapp]=ddencmp( 'den' , 'wv' ,x);  


[y, cxc, lxc, perf0, perfl2]=wdencmp( 'gbl' ,x, 'db3' ,2,thr,sorh,keepapp);  