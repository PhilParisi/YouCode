% Fourier Transforms in MATLAB (Discrete)
% Phil Parisi - Updated July 2022

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc, clearvars, close all, format compact

%%%%%%%%%%% INITIAL SETUP

% Raw Data (sea level height, meters)
x = [1.97 1.46 0.98 0.73 0.67 0.82 1.15 1.58 2 2.33 ...
    2.48 2.43 2.25 2.02 1.82 1.72 1.75 1.91 2.22 2.54 ...
    2.87 3.1 3.15 2.94 2.57 2.06 1.56 1.13 0.84 0.73 ...
    0.79 1.07];             % 32 data points
t = 1:0.5:16.5;             % each spaced 0.5s apart

% Parameters
L = length(x);              % number of samples  (samples)
%Fs = mean(diff(t));        % sampling frequency (samples/sec)
Fs = 2;                     % 2 samples/s (adjust based on your application)
f = (0:L-1) * Fs/L;         % frequency (Hz, 1/s) samples/sec / samples
 
% Plot Raw Data
figure(1)
plot(t,x,'*k')   % visualize raw data
grid on, xlabel('Time (s)'), ylabel('Sea Level (m)')
title('Raw Data')


%%%%%%%%%%% FOURIER TRANSFORM

% Take the FFT
X = fft(x);         % complex numbers!!! --> angle and amplitude
X_norm = 1/L * X;   

% Amplitude and Phase Spectrum (Full Spectrum, not half spectrum)
figure(2)
subplot(1,2,1)
stem(f,abs(X_norm),'*k','linewidth',2), xlabel('frequency (Hz)'),ylabel('Amplitude'), grid on
title('Amplitude Spectrum')
subplot(1,2,2)
stem(f,angle(X_norm),'*k','linewidth',2), xlabel('frequency (Hz)'),ylabel('Phase Angle'), grid on
title('Phase Spectrum')

% A cos(2*pi*f + phase)

% Make a Table of Values (Coeffs, Freq, Amplitude, Angle)
table1 = table(X_norm.',f.',abs(X_norm.'),angle(X_norm.'));     % use .' to only invert
table1.Properties.VariableNames = {'FFT Coeffs','Frequency','Amplitude','Phase'};
disp(table1)


%%%%%%%%%%% DOMINANT FREQUENCIES

% Reconstruct Using k Dominant Frequencies
X_recon_dom = X;
k = 3;                  % keeps the first #k and last #k + the mean
for i = (k+2):(L-k)     % keep 1st value (avg) and k-front and k-end
    X_recon_dom(i) = 0;
end

% Inverse Fourier Transform using DOMINANT FREQUENCIES 
% AKA reconstruct the signal using only dominant frequencies (not all frequencies present)
x_recon_dom = ifft(X_recon_dom);

% Plot of Signal using Dominant Frequencies
figure(3)
plot(t, x,'k-*','linewidth',2) % Raw Data
hold on, grid on
plot(t, x_recon_dom,'b--','linewidth',2) % Reconstructed
xlabel('Time (s)'), ylabel('Sea Level (m)')
title('Dominant Frequency Reconstruction of Signal')
l2 = append(num2str(k),' FFT Dominant Terms');
legend('Raw Data',l2,'Location','Northwest')


%%%%%%%%%%% ALL FREQUENCIES

% Reconstruct signals using all the frequencies (should get original signal back)
X_recon = X;
x_recon = ifft(X_recon);

% Plot full reconstruction
figure(4)
plot(t, x,'k-*','linewidth',2) % Raw Data
hold on, grid on
plot(t, x_recon,'b--','linewidth',2) % Reconstructed
xlabel('Time (s)'), ylabel('Sea Level (m)')
title('Sea Level Height vs. Time')
l2 = append(num2str(length(x_recon)),' FFT Dominant Terms');
legend('Raw Data',l2,'Location','Northwest')
