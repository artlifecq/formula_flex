package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianPaiHang_Item;
	
	import starling.display.DisplayObject;
	
	public class JiXianBossRankItem extends ViewUI
	{
		private var _skin:JiXianPaiHang_Item;
		private var _initX:int=0;
		private var _initY:int=0;
		
		private var _tipsData:DynamicTipData;
		private var _tipsSetInfo:BossHurtTipsData;
		
		public function JiXianBossRankItem()
		{
			_skin=new JiXianPaiHang_Item();
			super(_skin);
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
			TipTargetManager.show( _skin.uiBaoxiang, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));
		}
		public function get initX():int
		{
			return _initX;
		}
		
		public function get initY():int
		{
			return _initY;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			//			switch(target){
			//				case _skin.btn_enter:
			//					enterBtnHandler();
			//					break;
			//			}			
		}
		
		override public function show(data:Object=null):void
		{
			super.show();
		}	
		
		public function setPoint(x:int,y:int):void
		{
			_initX = x;
			_initY = y;
			this.x = _initX;
			this.y = _initY;
		}
		
		public function setData(rank:int,info:BossDamageInfo,totalHp:int):void
		{
			if(info!=null)
			{
				var num:int=rank+1;
				_tipsSetInfo.rewads=ActivetyDataManager.jixianVo.getRankReward(num);
				if(num<=3){
					_tipsSetInfo.titleRes="ui/app/activety/shijieboss/"+num+".png";
					_skin.uiNo.styleName = "ui/app/activety/shijieboss/number/"+num+".png";
					_skin.uiNo.visible=true;
					_skin.lbNo.visible=false;
				}
				else{
					_tipsSetInfo.titleRes="ui/app/activety/shijieboss/4.png";
					_skin.lbNo.text=num.toString();
					_skin.uiNo.visible=false;
					_skin.lbNo.visible=true;
				}
				if(num%2==0){
					_skin.bg1.visible=false;
					_skin.bg2.visible=true;
				}else{
					_skin.bg1.visible=true;
					_skin.bg2.visible=false;
				}
				_skin.lbName.text=info.playerName;
				var nu:Number=Math.min(info.damage/totalHp,1);
				_skin.lbKillNum.text=info.damage.toString()+"("+(nu*100).toFixed(0)+"%)";		
			}
		}
	}
}
