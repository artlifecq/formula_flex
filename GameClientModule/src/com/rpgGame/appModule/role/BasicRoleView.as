package com.rpgGame.appModule.role
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.juese_Skin;

	/**
	 *基本部分 
	 * @author dik
	 * 
	 */
	public class BasicRoleView
	{
		private var _skin : juese_Skin;
		private var _roleData:HeroData;
		private var _msEftC:Inter3DContainer;
		private var _msEft:InterObject3D;
		
		public function BasicRoleView(skin:juese_Skin)
		{
			_skin=skin;
			_msEftC=new Inter3DContainer();
			_skin.container.addChild(_msEftC);
			_msEft=_msEftC.playInter3DAt(ClientConfig.getEffect("ui_jiemian_miaoshang"),120,125,0);
			_skin.uiLd.imageScaleMode=UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
		}
		
		public function show(data:HeroData):void
		{
			_roleData=data;
			initEvent();
			
			updateTxt();
			updateEXPMP();
		}
		
		private function updateTxt():void
		{
			_skin.num_miaoshang.number=_roleData.totalStat.getStatValue(CharAttributeType.HURT_SEC);
			_skin.txt_gengu.text=_roleData.totalStat.getStatValueString(CharAttributeType.GENGU);
			_skin.txt_shenfa.text=_roleData.totalStat.getStatValueString(CharAttributeType.SHENFA);
			_skin.txt_gongji.text=_roleData.totalStat.getStatValueString(CharAttributeType.WAI_GONG);
			_skin.txt_fangyu.text=_roleData.totalStat.getStatValueString(CharAttributeType.DEFENSE_PER);
			_skin.txt_mingzhong.text=int(_roleData.totalStat.getStatValueString(CharAttributeType.HIT))-CharAttributeType.BAISC_HIT+"";
			_skin.txt_shanbi.text=_roleData.totalStat.getStatValueString(CharAttributeType.MISS);
			_skin.txt_baoji.text=_roleData.totalStat.getStatValueString(CharAttributeType.CRIT_PER);
			_skin.txt_baoshang.text=int(_roleData.totalStat.getStatValueString(CharAttributeType.CRIT))-CharAttributeType.BAISC_CRIT+"";		
			_skin.txt_gongsu.text=_roleData.totalStat.getStatValueString(CharAttributeType.ATT_SPEED);
			
			_skin.num_miaoshang.bounds.width=_skin.num_miaoshang.width;
			
			if(MainRoleManager.actorInfo.job==JobEnum.ROLE_4_TYPE){//医家
				_skin.txt_lidao.text=_roleData.totalStat.getStatValueString(CharAttributeType.HUIGEN);
				_skin.uiLd.styleName="ui/art_txt/common/shuxing/hg.png";
			}else{
				_skin.txt_lidao.text=_roleData.totalStat.getStatValueString(CharAttributeType.LIDAO);
				_skin.uiLd.styleName="ui/art_txt/common/shuxing/ld.png";
			}
		}
		
		public function onHide():void
		{
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);
			
			EventManager.removeEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);
			
			TipTargetManager.remove( _skin.txt_zhenqi);
			TipTargetManager.remove( _skin.txt_jinyan);
			TipTargetManager.remove( _skin.txt_lidao);
			TipTargetManager.remove( _skin.txt_gengu);
			TipTargetManager.remove( _skin.txt_shenfa);
			TipTargetManager.remove( _skin.txt_gongji);
			TipTargetManager.remove( _skin.txt_fangyu);
			TipTargetManager.remove( _skin.txt_mingzhong);
			TipTargetManager.remove( _skin.txt_baoji);
			TipTargetManager.remove( _skin.txt_baoshang);
			TipTargetManager.remove( _skin.txt_gongsu);
			
			TipTargetManager.remove( _skin.uiZq);
			TipTargetManager.remove( _skin.uiJy);
			TipTargetManager.remove( _skin.uiLd);
			
			TipTargetManager.remove( _skin.uiHg);
			TipTargetManager.remove( _skin.uiSf);
			TipTargetManager.remove( _skin.uiGj);
			TipTargetManager.remove( _skin.uiFy);
			TipTargetManager.remove( _skin.uiMz);
			TipTargetManager.remove( _skin.uiSb);
			TipTargetManager.remove( _skin.uiBj);
			TipTargetManager.remove( _skin.uiBs);
			TipTargetManager.remove( _skin.uiGs);
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);//经验改变
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);//真气变化
			EventManager.addEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);//最大真气经验改变
			EventManager.addEvent(MainPlayerEvent.MAXHP_CHANGE,HpCHangeHandler);
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE,HpCHangeHandler);
			
			TipTargetManager.show( _skin.txt_zhenqi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(2)));
			TipTargetManager.show( _skin.txt_jinyan,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(1)));
			if(MainRoleManager.actorInfo.job==JobEnum.ROLE_4_TYPE){//医家
				TipTargetManager.show( _skin.txt_lidao,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(5)));
			}else{
				TipTargetManager.show( _skin.txt_lidao,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(3)));
			}
			
			TipTargetManager.show( _skin.txt_gengu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(4)));
			TipTargetManager.show( _skin.txt_shenfa,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(6)));
			TipTargetManager.show( _skin.txt_gongji,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(8)));
			TipTargetManager.show( _skin.txt_fangyu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(14)));
			TipTargetManager.show( _skin.txt_mingzhong,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(11)));
			TipTargetManager.show( _skin.txt_shanbi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(13)));
			TipTargetManager.show( _skin.txt_baoji,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(17)));
			TipTargetManager.show( _skin.txt_baoshang,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(18)));
			TipTargetManager.show( _skin.txt_gongsu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(10)));
			
			TipTargetManager.show( _skin.uiZq,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(2)));
			TipTargetManager.show( _skin.uiJy,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(1)));
			if(MainRoleManager.actorInfo.job==JobEnum.ROLE_4_TYPE){//医家
				TipTargetManager.show( _skin.uiLd,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(5)));
			}else{
				TipTargetManager.show( _skin.uiLd,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(3)));
			}
			
			TipTargetManager.show( _skin.uiHg,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(4)));
			TipTargetManager.show( _skin.uiSf,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(6)));
			TipTargetManager.show( _skin.uiGj,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(8)));
			TipTargetManager.show( _skin.uiFy,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(14)));
			TipTargetManager.show( _skin.uiMz,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(11)));
			TipTargetManager.show( _skin.uiSb,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(13)));
			TipTargetManager.show( _skin.uiBj,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(17)));
			TipTargetManager.show( _skin.uiBs,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(18)));
			TipTargetManager.show( _skin.uiGs,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(10)));
		}
		
		private function updateEXPMP(type:int=1):void
		{
			if(type!=CharAttributeType.RES_EXP&&type!=CharAttributeType.RES_ZHENQI){
				return;
			}
			_skin.txt_shengmin.text=_roleData.totalStat.hp+"/"+_roleData.totalStat.life;
			_skin.txt_zhenqi.text=_roleData.curZhenqi+"/"+_roleData.maxZhenqi;			
			_skin.txt_jinyan.text=_roleData.curExp+"/"+_roleData.maxExp;
			_skin.pro_shengmin.maximum=_roleData.totalStat.life;
			_skin.pro_shengmin.value=_roleData.totalStat.hp;
			
			_skin.pro_zhenqi.maximum=_roleData.maxZhenqi;
			_skin.pro_zhenqi.value=_roleData.curZhenqi;
			
			_skin.pro_jinyan.maximum=_roleData.maxExp;
			_skin.pro_jinyan.value=_roleData.curExp;
		}
		
		private function HpCHangeHandler(role:RoleData):void
		{
			if(role!=MainRoleManager.actorInfo){
				return;
			}
			_skin.pro_shengmin.maximum=_roleData.totalStat.life;
			_skin.pro_shengmin.value=_roleData.totalStat.hp;
			_skin.txt_shengmin.text=_roleData.totalStat.hp+"/"+_roleData.totalStat.life;
		}
	}	
}