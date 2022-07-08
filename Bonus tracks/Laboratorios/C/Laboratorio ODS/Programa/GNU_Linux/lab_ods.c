

#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>


int x, y, comp1, comp2, pais_user, ann_user;
float val1, val2;
char op, in_cont;

int clean_stdin(void){
    while (getchar() != '\n');
    return(1);
}


void procesar_totales(float matt[22][36]){
    for(x = 0; x <= 20; x++){
        for(y = 0; y <= 34; y++){
            matt[21][y] = matt[21][y] + matt[x][y];
            matt[x][35] = matt[x][35] + matt[x][y];
            matt[21][35] = matt[21][35] + matt[x][y];
        }
    }
}


void lista_de_paises(int y){
    switch(y){
        case 0: printf("Antigua y Barbuda"); break;
        case 1: printf("Argentina"); break;
        case 2: printf("Bahamas"); break;
        case 3: printf("Barbados"); break;
        case 4: printf("Belize"); break;
        case 5: printf("Bolivia"); break;
        case 6: printf("Brasil"); break;
        case 7: printf("Canadá"); break;
        case 8: printf("Chile"); break;
        case 9: printf("Colombia"); break;
        case 10: printf("Costa Rica"); break;
        case 11: printf("Cuba"); break;
        case 12: printf("Dominica"); break;
        case 13: printf("Ecuador"); break;
        case 14: printf("El Salvador"); break;
        case 15: printf("Estados Unidos"); break;
        case 16: printf("Granada"); break;
        case 17: printf("Guatemala"); break;
        case 18: printf("Guyana"); break;
        case 19: printf("Haití"); break;
        case 20: printf("Honduras"); break;
        case 21: printf("Jamaica"); break;
        case 22: printf("México"); break;
        case 23: printf("Nicaragua"); break;
        case 24: printf("Panamá"); break;
        case 25: printf("Paraguay"); break;
        case 26: printf("Perú"); break;
        case 27: printf("República Dominicana"); break;
        case 28: printf("San Cristóbal y Nieves"); break;
        case 29: printf("San Vicente y las Granadinas"); break;
        case 30: printf("Santa Lucía"); break;
        case 31: printf("Surinam"); break;
        case 32: printf("Trinidad y Tobago"); break;
        case 33: printf("Uruguay"); break;
        case 34: printf("Venezuela"); break;
    }
}


void listar_todo(float matt[22][36]){
    for(y = 0; y <= 34; y++){
        for(x = 0; x <= 20; x++){
            printf("Año >> %d | País >> ", 2000+x); lista_de_paises(y); printf(" | Emisiones de CO2 per cápita (metrics tons per cápita) >> %f\n", matt[x][y]);
        }
        printf("Total de emisiones en "); lista_de_paises(y); printf(" >> %f\n\n", matt[21][y]);
    }
    printf("\nTotal de emisiones en el Continente Americano >> %f\n", matt[21][35]);
}


void listar_totales(float matt[22][36]){
    for(x = 0; x <= 20; x++){
        printf("Emisiones totales de CO2 en el año %d >> %f\n", x+2000, matt[x][35]);
    }

    for(y = 0; y <= 34; y++){
        printf("Emisiones totales de CO2 de "); lista_de_paises(y); printf(" >> %f\n", matt[21][y]);
    }
}


void pais_menorymayor(float matt[22][36]){
    int men, may;
    float res_men = 100000000;
    float res_may = 0;

    for(y = 0; y <= 34; y++){

        if (matt[21][y] < res_men){
            men = y;
            res_men = matt[21][y];
        } else {
            if (matt[21][y] > res_may){
                may = y;
                res_may = matt[21][y];
            }
        }

    }
    printf("El país con menores emisiones de CO2 per cápita (metrics tons per cápita) es "); lista_de_paises(men); printf(" con >> %f\n", matt[21][men]);
    printf("El país con mayores emisiones de CO2 per cápita (metrics tons per cápita) es "); lista_de_paises(may); printf(" con >> %f\n", matt[21][may]);
}


int ingresar_pais(void){

    printf("Indique el país según la denominación a continuación...\n");

    for(x = 0; x <= 34; x++){
        lista_de_paises(x); printf(" >> %d\n", x+1);
    }

    if(((scanf("%d%c", &pais_user, &in_cont) != 2 || in_cont != '\n') && clean_stdin()) || pais_user < 1 || pais_user > 35){
        system("clear");
        printf("Ha ingresado un valor incorrecto.\n");
        ingresar_pais();
	}

    return(pais_user);
}


void e_pais_user(float matt[22][36]){

    ingresar_pais();
    system("clear");
    printf("El número de emisiones de "); lista_de_paises(pais_user-1); printf(" es >> %f\n", matt[21][pais_user-1]);

}


int ingresar_ann(void){

    printf("Indique el año que desee evaluar desde el 2000 al 2020, ingresando el año completo (4 dígitos) \n");

    if(((scanf("%d%c", &ann_user, &in_cont) != 2 || in_cont != '\n') && clean_stdin()) || ann_user < 2000 || ann_user > 2020){
        system("clear");
        printf("Ha ingresado un valor incorrecto.\n");
        ingresar_ann();
	}

    return(ann_user);
}


void e_ann_user(float matt[22][36]){

    ingresar_ann();
    system("clear");
    printf("El número de emisiones del año %d es >> %f\n", ann_user, matt[ann_user-2000][35]);
}


void comp_paises(float matt[22][36]){
    printf("Ingrese dos países que desee comparar.");

    comp1 = ingresar_pais()-1;
    val1 = matt[21][pais_user-1];

    comp2 = ingresar_pais()-1;
    val2= matt[21][pais_user-1];

    system("clear");
    if(val1 > val2){
        lista_de_paises(comp1); printf(" posee un número mayor de emisiones que "); lista_de_paises(comp2); printf(" con %f y %f, respectivamente.\n", val1, val2);
    } else
        if(val1 < val2){
            lista_de_paises(comp2); printf(" posee un número mayor de emisiones que "); lista_de_paises(comp1); printf(" con %f y %f, respectivamente.\n", val2, val1);
        } else {
            printf("Ha ingresado el mismo país. "); lista_de_paises(comp1); printf(" posee un número de emisiones de "); printf("%f\n", val1);
        }
}


void comp_ann(float matt[22][36]){

    comp1 = ingresar_ann() - 2000;
    comp2 = ingresar_ann() - 2000;

    if(matt[comp1][35] > matt[comp2][35]){
        printf("En el año %d hubo mayores emisiones de CO2 con respecto a %d con %f y %f, respectivamente.\n", comp1+2000, comp2+2000, matt[comp1][35], matt[comp2][35]);
    } else
        if(matt[comp1][35] < matt[comp2][35]){
            printf("En el año %d hubo mayores emisiones de CO2 con respecto a %d con %f y %f, respectivamente.\n", comp2+2000, comp1+2000, matt[comp2][35], matt[comp1][35]);
        } else {
            printf("Se han seleccionado dos años iguales. En el año %d hubo %f emisones de CO2.\n", comp1+2000, matt[comp1][35]);
        }
}


char menu(void){
    printf("\nSeleccione una opción: \n");
    printf("1- Listar todos los países, por año y con sus respectivos totales.\n");
    printf("2- Listar los totales, por país y año.\n");
    printf("3- Listar el país con menor y mayor número de emisiones en total.\n");
    printf("4- Ingresar un país para conocer su número total de emisiones.\n");
    printf("5- Ingresar un año para conocer su número total de emisiones.\n");
    printf("6- Ingresar dos países para realizar una comparación acerca de sus emisiones.\n");
    printf("7- Ingresar dos años para realizar una comparación acerca de sus emisiones.\n");
    printf("8- Detener la ejecución del programa.\n");
    scanf("%s", &op);

    if(op == '8'){
        exit(0);
    }

    if(!(op >= '1' && op <= '7')){
        system("clear");
        printf("Ha ingresado una opción incorrecta.\n");
        printf("Por favor, ingrese un valor del 1 al 8\n");
        op = menu();
    }
    system("clear");
    return(op);
}


char pregunta(void){
    printf("\nIngrese >> s << para realizar otra operación.");
    printf("\nIngrese >> n << para detener la ejecución del programa.\n");
    scanf("%s", &op);
    op = toupper(op);

    if(op != 'S' && op != 'N'){
        system("clear");
        printf("Ha ingresado un dato erróneo.");
        op = pregunta();
    }
    system("clear");
    return(op);
}


void inicio(void){

    printf("\nIngrese >> s << para iniciar el programa.\n");
    printf("Ingrese >> n << para detener la ejecución del programa.\n");
    scanf("%s", &op);
    op = toupper(op);

    if(op != 'S' && op != 'N'){
        system("clear");
        printf("\nHa ingresado un dato erróneo.\n");
        inicio();
    }

    system("clear");
    if(op == 'N'){
        exit(0);
    }

}


int main(void){
    system("clear");
    inicio();

    float matt[22][36] = {
    {3.8565, 3.8610, 6.7983, 4.2414, 1.6001, 1.0264, 1.9462, 18.5218, 3.7866, 1.4196, 1.3613, 2.3166, 1.4730, 1.6215, 0.9632, 21.3357, 1.8527, 0.8381, 2.3405, 0.1931, 0.7498, 3.8852, 4.0047, 0.7341, 1.8904, 0.6774, 1.1377, 2.2419, 3.9064, 1.3597, 2.2208, 4.6552, 19.0909, 1.5869, 6.2776, 0.0000},
    {3.8438, 3.5949, 6.4292, 4.3532, 1.7525, 0.9664, 1.9536, 18.1037, 3.3873, 1.3896, 1.4047, 2.2585, 1.5777, 1.7763, 0.9883, 20.7474, 1.8809, 0.8581, 2.3404, 0.1709, 0.8297, 3.9542, 4.0948, 0.7622, 2.2505, 0.6808, 1.0068, 2.2265, 3.9431, 1.6640, 2.2700, 4.9580, 20.8940, 1.5127, 6.9777, 0.0000},
    {4.2116, 3.3011, 6.6216, 4.3872, 1.6478, 0.9589, 1.9370, 18.1110, 3.4729, 1.3561, 1.5229, 2.2790, 1.4690, 1.8833, 1.0181, 20.7003, 1.9799, 0.8782, 2.3023, 0.2039, 0.8468, 3.7888, 4.0514, 0.7644, 1.8484, 0.6973, 0.9966, 2.4011, 4.3804, 1.7287, 2.2528, 3.2352, 22.3857, 1.3703, 7.6790, 0.0000},
    {4.4350, 3.5347, 6.6113, 4.5393, 1.6047, 1.1211, 1.8956, 18.4941, 3.4615, 1.3763, 1.5808, 2.3103, 1.6725, 2.0006, 1.0735, 20.7437, 2.0786, 0.8358, 2.4930, 0.1910, 0.9311, 3.9370, 4.2467, 0.8192, 1.8978, 0.7157, 0.9575, 2.4118, 4.3248, 1.8266, 2.3509, 3.1516, 25.1260, 1.3620, 7.4930, 0.0000},
    {4.5602, 4.0799, 6.4228, 4.6117, 1.4178, 1.1231, 1.9642, 18.2540, 3.6857, 1.2969, 1.6193, 2.2418, 2.0301, 2.1172, 1.0382, 20.9130, 1.9664, 0.8737, 2.5844, 0.1826, 0.9878, 3.8804, 4.1990, 0.8160, 1.7468, 0.7087, 1.1478, 1.9314, 4.5876, 2.0258, 2.4907, 3.1514, 25.2503, 1.6754, 5.8188, 0.0000},
    {4.5878, 4.1507, 5.8651, 4.7740, 1.4847, 1.2105, 1.9576, 17.9035, 3.7649, 1.4083, 1.5689, 2.1704, 2.0246, 2.1676, 1.0406, 20.7954, 2.0655, 0.9247, 2.1704, 0.1875, 0.9158, 3.8017, 4.3771, 0.7851, 2.0934, 0.6490, 1.3254, 1.9721, 4.2230, 2.0240, 2.3768, 3.1805, 29.2666, 1.7240, 6.1978, 0.0000},
    {4.6512, 4.4441, 5.6006, 4.8394, 1.5218, 1.2291, 1.9603, 17.5618, 3.9102, 1.4353, 1.6124, 2.1927, 2.0206, 2.0552, 1.1050, 20.3240, 2.1997, 0.9089, 2.0226, 0.1875, 1.0055, 4.2031, 4.4307, 0.8013, 2.2184, 0.6610, 1.0117, 2.0732, 4.2575, 1.9905, 2.4814, 3.4407, 32.5625, 1.9838, 5.9650, 0.0000},
    {4.8400, 4.3908, 5.5494, 4.8898, 1.5929, 1.3247, 2.0542, 18.0580, 4.2760, 1.3759, 1.8074, 2.1545, 2.5877, 2.3562, 1.1212, 20.3953, 2.2642, 0.8865, 2.3855, 0.1867, 1.0509, 3.8831, 4.3948, 0.8141, 2.1281, 0.6738, 1.2236, 2.1408, 4.5254, 2.1609, 2.5353, 3.4359, 34.5711, 1.7851, 5.5023, 0.0000},
    {4.8914, 4.6932, 5.5757, 5.7592, 1.4211, 1.3942, 2.1488, 17.3788, 4.2371, 1.5060, 1.7902, 2.5014, 2.3279, 2.0345, 1.0445, 19.4872, 2.3973, 0.7777, 2.2863, 0.1825, 1.0572, 3.8750, 4.4487, 0.7703, 2.0859, 0.7035, 1.4288, 2.1497, 4.4870, 2.0280, 2.5000, 3.7423, 33.5469, 2.4554, 6.1040, 0.0000},
    {5.1110, 4.4204, 5.5757, 5.6816, 1.6419, 1.4395, 2.0103, 16.1977, 3.9026, 1.6214, 1.7138, 2.5294, 2.2755, 2.2000, 1.0251, 17.8847, 2.3899, 0.7992, 2.5530, 0.1927, 0.9740, 2.8377, 4.2316, 0.7737, 2.3638, 0.7352, 1.7823, 2.0655, 4.5989, 2.5714, 2.4679, 3.8125, 33.4769, 2.3724, 6.0495, 0.0000},
    {5.1611, 4.5661, 5.3576, 5.1891, 1.6703, 1.5351, 2.2496, 16.3644, 4.1794, 1.6867, 1.6369, 3.0465, 2.4297, 2.3200, 1.0218, 18.3676, 2.4489, 0.7585, 2.5179, 0.2148, 0.9486, 2.7317, 4.0650, 0.7671, 2.4905, 0.8037, 1.9696, 2.1200, 4.4855, 2.0307, 2.7992, 4.5277, 35.3557, 1.8748, 6.4727, 0.0000},
    {4.9674, 4.6048, 5.8794, 5.3590, 1.6754, 1.6638, 2.3420, 16.4993, 4.5298, 1.6661, 1.5780, 2.6192, 2.1701, 2.4533, 1.0465, 17.7807, 2.3675, 0.7517, 2.6066, 0.2250, 1.0301, 2.9214, 4.1848, 0.8141, 2.6853, 0.8208, 1.6718, 2.1724, 4.6687, 1.9958, 2.7761, 4.0730, 34.9355, 2.2715, 6.0906, 0.0000},
    {5.0660, 4.5914, 6.3589, 5.1432, 1.3333, 1.7132, 2.5005, 16.3010, 4.5794, 1.7304, 1.5487, 2.6421, 2.3238, 2.4010, 1.0375, 16.9998, 2.5233, 0.7569, 2.5950, 0.2209, 1.0524, 2.7841, 4.2320, 0.7599, 2.5906, 0.8056, 1.8315, 2.1403, 4.4073, 2.1288, 2.7793, 4.8683, 33.8752, 2.5427, 6.2064, 0.0000},
    {5.0450, 4.5060, 7.3647, 5.0555, 1.2718, 1.8112, 2.6484, 16.2537, 4.6559, 1.8804, 1.6093, 2.4838, 2.3732, 2.5060, 0.9726, 17.3017, 2.8114, 0.8197, 2.5093, 0.2602, 1.0502, 2.9707, 4.1247, 0.7615, 2.7411, 0.7945, 1.4463, 2.1165, 4.4409, 2.0239, 2.7453, 5.0144, 33.4163, 2.2105, 6.9650, 0.0000},
    {4.9876, 4.4247, 6.5544, 4.4279, 1.3272, 1.9350, 2.7515, 15.9981, 4.3681, 1.8885, 1.6158, 2.4270, 2.4739, 2.7086, 0.9771, 17.3306, 2.1533, 0.8657, 2.5833, 0.2564, 1.0395, 2.6772, 3.9976, 0.7743, 2.7825, 0.8271, 1.6428, 2.1446, 4.5461, 2.3222, 2.7124, 5.0763, 34.0183, 1.9657, 6.2147, 0.0000},
    {5.1296, 4.4667, 5.7085, 4.4208, 1.7765, 1.9575, 2.5889, 15.9066, 4.5536, 1.9353, 1.5277, 2.5882, 2.4710, 2.5141, 1.0554, 16.7408, 2.3735, 0.9735, 2.6104, 0.2488, 1.0756, 2.7656, 3.9552, 0.8726, 2.7410, 0.9047, 1.6103, 2.2851, 4.5796, 2.1487, 2.6795, 4.8331, 32.9276, 1.9711, 5.9878, 0.0000},
    {5.1944, 4.3894, 5.2354, 4.4904, 1.6908, 2.0663, 2.3901, 15.3799, 4.6346, 1.9355, 1.6171, 2.4859, 2.5178, 2.3955, 1.0456, 16.2469, 2.4258, 1.0199, 3.0402, 0.2752, 1.0024, 2.8089, 3.9146, 0.8539, 2.6146, 1.0597, 1.7047, 2.3702, 4.6129, 2.2091, 2.7069, 4.0290, 29.0747, 1.9043, 5.6774, 0.0000},
    {5.1452, 4.2744, 5.4900, 4.0868, 1.6381, 2.1051, 2.4094, 15.5004, 4.5503, 1.7644, 1.6791, 2.2230, 2.2560, 2.3399, 0.9417, 16.0197, 2.5115, 1.0223, 2.9920, 0.2826, 0.9394, 2.6696, 3.6854, 0.8621, 2.7301, 1.1756, 1.7085, 2.2845, 4.6472, 1.9683, 2.7942, 4.3366, 28.8631, 1.7932, 5.4939, 0.0000},
    {5.1755, 4.0824, 7.0024, 4.3104, 1.5782, 2.1013, 2.3091, 15.6299, 4.5068, 1.7092, 1.6446, 1.9940, 2.2508, 2.2195, 0.9923, 16.4340, 2.7616, 1.0811, 3.1848, 0.3028, 1.0482, 2.7391, 3.6081, 0.8168, 2.5691, 1.2233, 1.7084, 2.4182, 4.6815, 2.1942, 2.8000, 4.3653, 29.1223, 1.9050, 4.1602, 0.0000},
    {5.0082, 3.7419, 6.7725, 4.2342, 1.6866, 2.0714, 2.3018, 15.5673, 4.5446, 1.7962, 1.7470, 1.9874, 2.1913, 2.1157, 1.0618, 15.9720, 2.9667, 1.2476, 3.1766, 0.2920, 1.1070, 2.7287, 3.4138, 0.8667, 2.8951, 1.2101, 1.6911, 2.5626, 4.5351, 2.1343, 2.7195, 4.3351, 28.9458, 1.9019, 3.4779, 0.0000},
    {4.3952, 3.4733, 5.9446, 3.7817, 1.4657, 1.7733, 2.1988, 14.1969, 4.2462, 1.7512, 1.5523, 1.7792, 1.9343, 1.7532, 0.9441, 14.2379, 2.6203, 1.0571, 2.8131, 0.2560, 0.9753, 2.5090, 2.7686, 0.7659, 2.4983, 1.0613, 1.3559, 2.5599, 3.9863, 1.8827, 2.3956, 3.7914, 25.3731, 1.6812, 2.9754, 0.0000},
    {0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.00000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.00000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.00000, 0.0000, 0.0000, 0.0000}
    };

    procesar_totales(matt);

    do{
        op = menu();

        switch(op){
            case '1': listar_todo(matt); break;
            case '2': listar_totales(matt); break;
            case '3': pais_menorymayor(matt); break;
            case '4': e_pais_user(matt); break;
            case '5': e_ann_user(matt); break;
            case '6': comp_paises(matt); break;
            case '7': comp_ann(matt); break;
        }

        pregunta();

    }while(op != 'N');

    return(0);
}
