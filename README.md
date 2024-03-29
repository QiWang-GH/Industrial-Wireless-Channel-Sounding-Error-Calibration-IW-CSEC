** NOTICE ** If you use or extend this code, please cite our work using the following citation.

Q. Wang, R. Candell, W. Liang and Z. Pang, "System Error Calibration in Large Datasets of Wireless Channel Sounding for Industrial Applications," in IEEE Journal of Emerging and Selected Topics in Industrial Electronics, vol. 3, no. 1, pp. 113-123, Jan. 2022, doi: 10.1109/JESTIE.2021.3122839.

# Industrial Wireless Channel Sounding-Error Calibration （IW-CSEC）
There are two methods to calibrate the CIR with system errors. One method is  channel sounding error calibration based on phase shifting (CSEC-Phase), another is channel sounding error calibration based on carrier frequency offset (CSEC-Frequency). Two types of system errors can be solved using this method. One error is sampling time deviation, another is phase shifting. 

The CSEC-Phase can compensate for all kinds of phase shifting and suitable for most scenarios. However, the compensated phase offset may eliminate the phase offset caused by the dynamic change of the channel.

The CSEC-Frequency compensates for phase shifting by estimating carrier frequency offset. The advantage of this method is that the compensated phase shifting has a clear physical meaning, but the disadvantage is that it cannot compensate for the phase shifting caused by equipment and environmental noise. Not suitable for scenarios where the data collection time is too long.

This work has been publiced in the paper-System error calibration in large datasets of wireless channel sounding for industrial applications.
