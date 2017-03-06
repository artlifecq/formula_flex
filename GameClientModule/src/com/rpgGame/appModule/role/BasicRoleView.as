package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	
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
		public function BasicRoleView(skin:juese_Skin)
		{
			_skin=skin;
		}
		
		public function show():void
		{
			initEvent();
			
			updateTxt();
			updateEXPMP();
		}
		
		private function updateTxt():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			_skin.txt_miaoshang.text=info.totalStat.getStatValueString(CharAttributeType.HURT_SEC);
			_skin.txt_lidao.text=info.totalStat.getStatValueString(CharAttributeType.LIDAO);
			_skin.txt_genggu.text=info.totalStat.getStatValueString(CharAttributeType.GENGU);
			_skin.txt_huigeng.text=info.totalStat.getStatValueString(CharAttributeType.HUIGEN);
			_skin.txt_shenfa.text=info.totalStat.getStatValueString(CharAttributeType.SHENFA);
			_skin.txt_qixue.text=info.totalStat.getStatValueString(CharAttributeType.QI_XUE);
			_skin.txt_waigong.text=info.totalStat.getStatValueString(CharAttributeType.WAI_GONG);
			_skin.txt_neigong.text=info.totalStat.getStatValueString(CharAttributeType.NEI_GONG);
			_skin.txt_gongsu.text=info.totalStat.getStatValueString(CharAttributeType.ATT_SPEED);
			_skin.txt_mingzhonglv.text=info.totalStat.getStatValueString(CharAttributeType.HIT)+"%";
			_skin.txt_baojikangxing.text=info.totalStat.getStatValueString(CharAttributeType.ANTI_CRIT_PER);
			_skin.txt_bishanlv.text=info.totalStat.getStatValueString(CharAttributeType.MISS)+"%";
			_skin.txt_fangyubaifenbi.text=info.totalStat.getStatValueString(CharAttributeType.DEFENSE_PER)+"%";
			_skin.txt_shengminhuifu.text=info.totalStat.getStatValueString(CharAttributeType.HP_REC)+"/5秒";
			_skin.txt_zhiliaotishen.text=info.totalStat.getStatValueString(CharAttributeType.CURE_LIFT)+"%";
			_skin.txt_baojilv.text=info.totalStat.getStatValueString(CharAttributeType.CRIT_PER)+"%";
			_skin.txt_baojijiacheng.text=info.totalStat.getStatValueString(CharAttributeType.CRIT)+"%";		
		}
		
		public function onHide():void
		{
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);
			
			EventManager.removeEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);
			EventManager.removeEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateTxt);//基本属性改变
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE,updateEXPMP);//经验改变
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateEXPMP);//真气变化
			EventManager.addEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateEXPMP);//最大真气经验改变
		}
		
		private function updateEXPMP(type:int=1):void
		{
			if(type!=CharAttributeType.RES_EXP&&type!=CharAttributeType.RES_ZHENQI){
				return;
			}
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			_skin.txt_zhenqi.text=MainRoleManager.actorInfo.curZhenqi+"/"+MainRoleManager.actorInfo.maxZhenqi;			
			_skin.txt_jinyan.text=MainRoleManager.actorInfo.curExp+"/"+MainRoleManager.actorInfo.maxExp;
			
			_skin.pro_jinyan.maximum=MainRoleManager.actorInfo.maxExp;
			_skin.pro_jinyan.value=MainRoleManager.actorInfo.curExp;
			_skin.pro_zhenqi.maximum=MainRoleManager.actorInfo.maxZhenqi;
			_skin.pro_zhenqi.value=MainRoleManager.actorInfo.curZhenqi;
		}
	}	
}