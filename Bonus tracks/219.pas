Ejercicio 2.2.19
En una Empresa Farmacéutica se posee un archivo MAE_REMEDIOS (ordenado por Clave: Farmacia + Medicamento), el que se actualiza semanalmente, a traves de la información que se encuentra cargada en un archivo de MOVIMIENTOS (ordenado por Clavem: Farmacia + Medicamento, y Cod_Mov), de la siguiente forma:

Si Clave (MAE_REMEDIOS) es menor que Clavem (MOVIMIENTOS), simplemente se transfieren los datos del Maestro a la salida y se graban.

Si Clave (MAE_REMEDIOS) es igual a Clavem (MOVIMIENTOS) y el Codmov es 1, se considera error y se lista un mensaje indicando el tipo de error; pero si el Codmov es 2, entonces es un remedio que deja de fabricarse y se transfiere el registro al archivo de Remedios vencidos (REM_VENC) ; pero si el Cod_Mov es 3, se modifica la cantidad actual con la cantidad recibida.

Si Clave (MAE_REMEDIOS) es mayor que Clavem (MOVIMIENTOS) y el Codmov es 1, se incorpora el remedio a nuestro Vademecum, considerando que la cantidad recibida configura la cantidad actual y la Fecha_Vencimiento es 30 días posterior a la fecha actual; pero si el Codmov es 2 o 3 se considera error y se deben producir los correspondientes mensajes de error.

Se considera que solo existe un registro de movimiento para cada registro del maestro.

MAE_REMEDIOS Ordenado por Farmacia y Medicamento

Farmacia Medicamento Cant_Actual Fecha_Vencimiento
MOVIMIENTOS Ordenado por Farmacia, Medicamento y Cod_Mov

Farmacia Medicamento Cod_MovCant_Recibida
REM_VENC Ordenado por Medicamento

MedicamentoCant_Vencida

Acción 2.2.19 es
Ambiente
    fecha = registro
        aa:(1..31)
        mm:(1..12)
        aaaa:N(4)
    fin_registro

    clave = registro
        Farmacia: AN(40)
        Medicamento: AN(40)
    fin_registro

    maestro = registro
        claveR: clave
        Cant_Actual:N(3)
        Fecha_Vencimiento: fecha
    Fin_registro

    mae: archivo de maestro ordenado por Farmacia y Medicamento;
    regmae: maestro
    sal: archivo de maestro ordenado por Farmacia y Medicamento;
    regsal: maestro

    movimientos = registro
        claveM: clave
        Cod_Mov:AN(6)
        Cant_Recibida:N(3)
    Fin_registro

    mov:ordenado por Farmacia + Medicamento y Cod_Mov
    regmov: movimientos

    REM_VENC = registro
        Medicamento:AN(40)
        Cant_Vencida:N(3)
    fin_registro

    venc: archivo de REM_VENC ordenado por medicamento
    regvenc: REM_VENC

    Procedimiento avanzar1 es
    Proceso
        leer(mae,regmae)
    si fda (mae) es
        regmae.clave.farmacia:= HV
        regmae.clave.medicamento:= HV
    fin_si
    Fin_procedimiento

    Procedimiento avanzar2 es
    Proceso
        leer(mov,regmov)
    si fda(mov) es
        regmov.clave.farmacia:= HV
        regmov.clave.medicamento:= HV
    fin_si
    Fin_Procedimiento

    Procedimiento Maestromayor es
    Proceso
        si regmov.cod_mov=('1')
            regsal.Cant_Actual:= regmov.Cant_recibida
            regsal.claveR:= regmae.claveR
            regsal.Fecha_Vencimiento:= regmae.Fecha_Vencimiento //ver bien que hacer
            escribir(sal,regsal)
        fin_si

        si regmov.cod_mov=('2') o regmov.cod_mov=('3')
            Escribir('Hay un error')
        fin_si

         si regmov.cod_mov=('3')
            Escribir('Hay un error')
        fin_si
    Fin_procedimiento

    Procedimiento Maestroigual es
    Proceso
        si regmov.cod_mov=('1')
            Escribir('Hay un error')
        fin_si

        si regmov.cod_mov=('2')
            regvenc.farmacia:= regmae.clave.farmacia
            escribir(venc,regvenc)
            regvenc.medicamento:= regmae.clave.medicamento
        fin_si

        si regmov.cod_mov('3')
            regsal.Cant_Actual:= regmae.Cant_Actual
            regsal.claveR:= regmae.claveR
            regsal.Fecha_Vencimiento:= regmae.Fecha_Vencimiento
            escribir(sal,regsal)
        fin_si
    Fin_procedimiento
    Procedimiento Maestromenor es
    Proceso
        regsal.Cant_Actual:= regmae.Cant_Actual
        regsal.claveR:= regmae.claveR
        regsal.Fecha_Vencimiento:= regmae.Fecha_Vencimiento
        escribir(sal,regsal)
    Fin_procedimiento


Acción
    abrir e/(mae)
    abrir e/(mov)
    abrir /s(venc)
    abrir /s(sal)
    avanzar1
    avanzar2

    Mientras (regmae.claveR <> HV) o (regmov.claveM <> HV) entonces
        si (regmae.claveR > regmov.claveM) entonces
            Maestromayor
            avanzar1
        sino
            si (regmae.claveR < regmov.claveM) entonces
                Maestromenor
                avanzar2
            sino
                Maestroigual
                avanzar1
                avanzar2
            fin_si
        fin_si
    Fin_Mientras



Si Clave (MAE_REMEDIOS) es menor que Clavem (MOVIMIENTOS), simplemente se transfieren los datos del Maestro a la salida y se graban.

Si Clave (MAE_REMEDIOS) es igual a Clavem (MOVIMIENTOS) y el Codmov es 1, se considera error y se lista un mensaje indicando el tipo de error; pero si el Codmov es 2, entonces es un remedio que deja de fabricarse y se transfiere el registro al archivo de Remedios vencidos (REM_VENC) ; pero si el Cod_Mov es 3, se modifica la cantidad actual con la cantidad recibida.

Si Clave (MAE_REMEDIOS) es mayor que Clavem (MOVIMIENTOS) y el Codmov es 1, se incorpora el remedio a nuestro Vademecum, considerando que la cantidad recibida configura la cantidad actual y la Fecha_Vencimiento es 30 días posterior a la fecha actual; pero si el Codmov es 2 o 3 se considera error y se deben producir los correspondientes mensajes de error.

Se considera que solo existe un registro de movimiento para cada registro del maestro.


Fin_acción
