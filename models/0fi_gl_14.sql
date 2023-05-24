with faglflexa as ( 

	select * 
	from {{ var('faglflexa') }}
),

bkpf as (

    select *
    from {{ var('bkpf') }}
),

bseg as (

    select *
    from {{ var('bseg') }}
),

final as (
    
    select
        ryear,
        docnr,
        rldnr,
        rbukrs,
        docln,
        activ,
        rmvct,
        rtcur,
        runit,
        awtyp,
        rrcty,
        rvers,
        logsys,
        racct,
        cost_elem,
        rcntr,
        prctr,
        rfarea,
        rbusa,
        kokrs,
        segment,
        scntr,
        pprctr,
        sfarea,
        sbusa,
        rassc,
        psegment,
        tsl,
        hsl,
        ksl,
        osl,
        msl,
        wsl,
        drcrk,
        poper,
        rwcur,
        gjahr,
        budat,
        belnr,
        buzei,
        bschl,
        bstat,
        timestamp,
        bukrs,
        blart,
        bldat,
        monat,
        cpudt,
        xblnr,
        waers,
        glvor,
        awkey,
        fikrs,
        hwaer,
        hwae2,
        hwae3,
        awsys,
        ldgrp,
        kursf,
        _fivetran_synced
    from faglflexa
    inner join bkpf
        on bkpf.bukrs = faglflexa.rbukrs
        and bkpf.belnr = faglflexa.belnr
        and bkpf.gjahr = faglflexa.gjahr
        and bkpf.mandt = faglflexa.rclnt
    left join bseg
        on bkpf.mandt = bseg.mandt
        and bkpf.bukrs = bseg.bukrs
        and bkpf.belnr = bseg.belnr
        and bkpf.gjahr = bseg.gjahr
        and faglflexa.buzei = bseg.buzei
    where bkpf.mandt = '800'
        and faglflexa.rldnr = '0l'
)

select *
from final