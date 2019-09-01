#line 1 "E:/house/GAS Leaquage Detector/MikroC/MyProject.c"

double source=0;
int temperature=0;
char txt[15];

void main() {
ADCON1=0x0D;
CMCON=7;
TRISB.F6=0;
 ADC_Init();

 while(1){
 source=Adc_Read(1);
 PORTB.F6=0;
if(source>600){
delay_ms(500);
PORTB.F6=1;
}
}
}
