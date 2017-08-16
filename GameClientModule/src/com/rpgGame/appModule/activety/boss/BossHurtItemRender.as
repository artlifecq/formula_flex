package com.rpgGame.appModule.activety.boss
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.NumberUtil;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.activety.shijieboss.ShangHai_Item;
	
	/**
	 *伤害渲染元素 
	 * @author dik
	 * 
	 */
	public class BossHurtItemRender extends DefaultListItemRenderer
	{
		private var _skin:ShangHai_Item;
		private var _tipsData:DynamicTipData;
		private var _tipsSetInfo:BossHurtTipsData;
		
		public function BossHurtItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new ShangHai_Item();
			_skin.toSprite(this);
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
			TipTargetManager.show( _skin.uiBaoxiang, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));
		}
		
		override public function dispose():void
		{
			super.dispose();
			TipTargetManager.remove( _skin.uiBaoxiang);
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				var info:BossHurtInfo=_data as BossHurtInfo;
				var actId:int=int(this.owner.customData);
				var actInfo:BossActInfo=ActivetyCfgData.getActInfoById(actId) as BossActInfo;
				_tipsSetInfo.rewads=actInfo.getRankReward(info.rank);
				if(info.rank<4){
					_tipsSetInfo.titleRes="ui/app/activety/shijieboss/"+info.rank+".png";
					_skin.uiNo.visible=true;
					_skin.lbNo.text="";
					_skin.uiNo.styleName="ui/app/activety/shijieboss/number/"+info.rank+".png";
					_skin.uiBaoxiang.styleName="ui/app/activety/shijieboss/icon/"+info.rank+".png";
				}else{
					_tipsSetInfo.titleRes="ui/app/activety/shijieboss/4.png";
					_skin.lbNo.text=info.rank.toString();
					_skin.uiNo.visible=false;
					_skin.uiBaoxiang.styleName="ui/app/activety/shijieboss/icon/4.png";
				}
				if(!info.bossDamageInfo){
					_skin.uiBaoxiang.visible=false;
					_skin.uiNo.visible=false;
					_skin.lbKillNum.visible=false;
					_skin.lbName.visible=false;
					_skin.lbNo.visible=false;
					_skin.bg1.visible=false;
					_skin.bg2.visible=false;
					return;
				}else{
					_skin.uiBaoxiang.visible=true;
//					_skin.uiNo.visible=true;
					_skin.lbKillNum.visible=true;
					_skin.lbName.visible=true;
					_skin.lbNo.visible=true;
					_skin.bg1.visible=true;
					_skin.bg2.visible=true;
				}
				var id:Number=info.bossDamageInfo.playerId.ToGID();
				if(MainRoleManager.isSelf(id)){
					_skin.lbNo.color=_skin.lbName.color=_skin.lbKillNum.color=StaticValue.UI_YELLOW;
				}else{
					_skin.lbNo.color=_skin.lbName.color=_skin.lbKillNum.color=StaticValue.UI_YELLOW1;
				}
				_skin.lbName.text=info.bossDamageInfo.playerName;
				_skin.lbKillNum.text=NumberUtil.getNumberTo(info.bossDamageInfo.damage,true)+"("+Number(info.perDamage)+"%)";
			}else{
				
			}
		}
	}
}