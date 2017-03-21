package com.rpgGame.appModule.role
{
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	
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
		private var PER_SERVER:Number=1000;
		public function BasicRoleView(skin:juese_Skin)
		{
			_skin=skin;
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
			_skin.txt_lidao.text=_roleData.totalStat.getStatValueString(CharAttributeType.LIDAO);
			_skin.txt_genggu.text=_roleData.totalStat.getStatValueString(CharAttributeType.GENGU);
			_skin.txt_huigeng.text=_roleData.totalStat.getStatValueString(CharAttributeType.HUIGEN);
			_skin.txt_shenfa.text=_roleData.totalStat.getStatValueString(CharAttributeType.SHENFA);
			_skin.txt_qixue.text=_roleData.totalStat.getStatValueString(CharAttributeType.QI_XUE);
			_skin.txt_waigong.text=_roleData.totalStat.getStatValueString(CharAttributeType.WAI_GONG);
			_skin.txt_neigong.text=_roleData.totalStat.getStatValueString(CharAttributeType.NEI_GONG);
			_skin.txt_gongsu.text=_roleData.totalStat.getStatValueString(CharAttributeType.ATT_SPEED);
			_skin.txt_mingzhonglv.text=_roleData.totalStat.getStatValue(CharAttributeType.HIT)/PER_SERVER+"%";
			_skin.txt_baojikangxing.text=_roleData.totalStat.getStatValueString(CharAttributeType.ANTI_CRIT_PER);
			_skin.txt_bishanlv.text=_roleData.totalStat.getStatValue(CharAttributeType.MISS)/PER_SERVER+"%";
			_skin.txt_fangyubaifenbi.text=_roleData.totalStat.getStatValue(CharAttributeType.DEFENSE_PER)+"";
			_skin.txt_shengminhuifu.text=_roleData.totalStat.getStatValueString(CharAttributeType.HP_REC)+"/5秒";
			_skin.txt_zhiliaotishen.text=_roleData.totalStat.getStatValue(CharAttributeType.CURE_LIFT)/PER_SERVER+"%";
			_skin.txt_baojilv.text=_roleData.totalStat.getStatValue(CharAttributeType.CRIT_PER)/PER_SERVER+"%";
			_skin.txt_baojijiacheng.text=_roleData.totalStat.getStatValue(CharAttributeType.CRIT)/PER_SERVER+"%";		
			
			var allW:int=_skin.msIcon.width+_skin.msName.width+_skin.num_miaoshang.width;
			var xx:int=(185-allW)/2;
			_skin.msIcon.x=xx;
			_skin.msName.x=_skin.msIcon.x+_skin.msIcon.width;
			_skin.num_miaoshang.x=_skin.msName.x+_skin.msName.width;
		}
		
		public function onHide():void
		{
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);
			
			EventManager.removeEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);
			
			TipTargetManager.remove( _skin.txt_jinyan);
			TipTargetManager.remove( _skin.txt_zhenqi);
			TipTargetManager.remove( _skin.txt_lidao);
			TipTargetManager.remove( _skin.txt_genggu);
			TipTargetManager.remove( _skin.txt_huigeng);
			TipTargetManager.remove( _skin.txt_shenfa);
			TipTargetManager.remove( _skin.txt_qixue);
			TipTargetManager.remove( _skin.txt_waigong);
			TipTargetManager.remove( _skin.txt_neigong);
			TipTargetManager.remove( _skin.txt_gongsu);
			TipTargetManager.remove( _skin.txt_mingzhonglv);
			TipTargetManager.remove( _skin.txt_baojikangxing);
			TipTargetManager.remove( _skin.txt_bishanlv);
			TipTargetManager.remove( _skin.txt_fangyubaifenbi);
			TipTargetManager.remove( _skin.txt_shengminhuifu);
			TipTargetManager.remove( _skin.txt_zhiliaotishen);
			TipTargetManager.remove( _skin.txt_baojilv);
			TipTargetManager.remove( _skin.txt_baojijiacheng);
			
			TipTargetManager.remove( _skin.lbl_jingyan);
			TipTargetManager.remove( _skin.lbl_zhenqi);
			TipTargetManager.remove( _skin.lbl_lidao);
			TipTargetManager.remove( _skin.lbl_genggu);
			TipTargetManager.remove( _skin.lbl_huigeng);
			TipTargetManager.remove( _skin.lbl_shenfa);
			TipTargetManager.remove( _skin.lbl_qixue);
			TipTargetManager.remove( _skin.lbl_waigong);
			TipTargetManager.remove( _skin.lbl_neigong);
			TipTargetManager.remove( _skin.lbl_gongsu);
			TipTargetManager.remove( _skin.lbl_minzhonglv);
			TipTargetManager.remove( _skin.lbl_baojikangxing);
			TipTargetManager.remove( _skin.lbl_bishanlv);
			TipTargetManager.remove( _skin.lbl_fangyubaifenbi);
			TipTargetManager.remove( _skin.lbl_shengminhuifu);
			TipTargetManager.remove( _skin.lbl_zhiliaotishen);
			TipTargetManager.remove( _skin.lbl_baojilv);
			TipTargetManager.remove( _skin.lbl_baojijiacheng);
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);//经验改变
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);//真气变化
			EventManager.addEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);//最大真气经验改变
			
			TipTargetManager.show( _skin.txt_jinyan,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(1)));
			TipTargetManager.show( _skin.txt_zhenqi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(2)));
			TipTargetManager.show( _skin.txt_lidao,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(3)));
			TipTargetManager.show( _skin.txt_genggu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(4)));
			TipTargetManager.show( _skin.txt_huigeng,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(5)));
			TipTargetManager.show( _skin.txt_shenfa,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(6)));
			TipTargetManager.show( _skin.txt_qixue,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(7)));
			TipTargetManager.show( _skin.txt_waigong,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(8)));
			TipTargetManager.show( _skin.txt_neigong,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(9)));
			TipTargetManager.show( _skin.txt_gongsu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(10)));
			TipTargetManager.show( _skin.txt_mingzhonglv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(11)));
			TipTargetManager.show( _skin.txt_baojikangxing,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(12)));
			TipTargetManager.show( _skin.txt_bishanlv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(13)));
			TipTargetManager.show( _skin.txt_fangyubaifenbi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(14)));
			TipTargetManager.show( _skin.txt_shengminhuifu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(15)));
			TipTargetManager.show( _skin.txt_zhiliaotishen,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(16)));
			TipTargetManager.show( _skin.txt_baojilv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(17)));
			TipTargetManager.show( _skin.txt_baojijiacheng,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(18)));
			
			TipTargetManager.show( _skin.lbl_jingyan,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(1)));
			TipTargetManager.show( _skin.lbl_zhenqi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(2)));
			TipTargetManager.show( _skin.lbl_lidao,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(3)));
			TipTargetManager.show( _skin.lbl_genggu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(4)));
			TipTargetManager.show( _skin.lbl_huigeng,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(5)));
			TipTargetManager.show( _skin.lbl_shenfa,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(6)));
			TipTargetManager.show( _skin.lbl_qixue,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(7)));
			TipTargetManager.show( _skin.lbl_waigong,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(8)));
			TipTargetManager.show( _skin.lbl_neigong,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(9)));
			TipTargetManager.show( _skin.lbl_gongsu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(10)));
			TipTargetManager.show( _skin.lbl_minzhonglv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(11)));
			TipTargetManager.show( _skin.lbl_baojikangxing,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(12)));
			TipTargetManager.show( _skin.lbl_bishanlv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(13)));
			TipTargetManager.show( _skin.lbl_fangyubaifenbi,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(14)));
			TipTargetManager.show( _skin.lbl_shengminhuifu,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(15)));
			TipTargetManager.show( _skin.lbl_zhiliaotishen,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(16)));
			TipTargetManager.show( _skin.lbl_baojilv,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(17)));
			TipTargetManager.show( _skin.lbl_baojijiacheng,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(18)));
		}
		
		private function updateEXPMP(type:int=1):void
		{
			if(type!=CharAttributeType.RES_EXP&&type!=CharAttributeType.RES_ZHENQI){
				return;
			}
			_skin.txt_zhenqi.text=_roleData.curZhenqi+"/"+_roleData.maxZhenqi;			
			_skin.txt_jinyan.text=_roleData.curExp+"/"+_roleData.maxExp;
			
			_skin.pro_jinyan.maximum=_roleData.maxExp;
			_skin.pro_jinyan.value=_roleData.curExp;
			_skin.pro_zhenqi.maximum=_roleData.maxZhenqi;
			_skin.pro_zhenqi.value=_roleData.curZhenqi;
		}
	}	
}