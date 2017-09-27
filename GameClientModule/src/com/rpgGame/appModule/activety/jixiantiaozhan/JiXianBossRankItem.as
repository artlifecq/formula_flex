package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.NumberUtil;
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
		private var _isSelf:Boolean;
		public function JiXianBossRankItem()
		{
			_skin=new JiXianPaiHang_Item();
			super(_skin);
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
			TipTargetManager.show( _skin.uiBaoxiang, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));var touch:TouchCtrl=new TouchCtrl(this,null,onOver,onOut);
			_skin.uiOver.visible=false;
			MCUtil.BringToTop(_skin.uiBaoxiang);
		}
		
		private function onOut():void
		{
			// TODO Auto Generated method stub
			_skin.uiOver.visible=false;
		}
		
		private function onOver():void
		{
			// TODO Auto Generated method stub
			_skin.uiOver.visible=true;
		}
		public function setSelf():void
		{
			_skin.bg1.visible=false;
			_skin.bg2.visible=false;
			_skin.lbKillNum.color=_skin.lbName.color=_skin.lbNo.color=GameColorUtil.COLOR_GREEN;
			_isSelf=true;
			//MCUtil.removeSelf(_skin.uiBaoxiang);
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
				_skin.uiBaoxiang.visible=rank!=0;
				if (rank==0) 
				{
					_skin.lbNo.text="未上榜";
					_skin.uiNo.visible=true;
					_skin.uiNo.visible=false;
				}
				else
				{
					var num:int=rank;
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
				}
				if (!_isSelf) 
				{
					_skin.bg1.visible=rank%2==0;
					_skin.bg2.visible=!_skin.bg1.visible;
				}
				_skin.lbName.text=info.playerName;
				var str:String
				if (totalHp!=0) 
				{
					str=(info.damage*100/totalHp).toFixed(2);
				}
				else
				{
					str="0.00";
				}
				
				_skin.lbKillNum.text=NumberUtil.getNumberTo(info.damage,true)+"("+str+"%)";		
			}
		}
	}
}
