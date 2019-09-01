
double source=0;
int temperature=0;
char txt[15];

void main() {
ADCON1=0x0D;                  // Configure RE1 pin as input
CMCON=7;
TRISB.F6=0;
  ADC_Init();                        // Initialize ADC
                 // Display "C" for Celsius
  while(1){
 source=Adc_Read(1);
 PORTB.F6=0;
if(source>600){  
delay_ms(500);     // when temperature goes higher than 30 degree , fan turns on .
PORTB.F6=1;
}
}
}