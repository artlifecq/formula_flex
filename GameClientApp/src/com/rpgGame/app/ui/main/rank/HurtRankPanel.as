package com.rpgGame.app.ui.main.rank
{
	import com.rpgGame.app.manager.RankManager;
	import com.rpgGame.app.manager.YuMaQiShouManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.YuMaQiShouSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.events.RankEvent;
	import com.rpgGame.core.events.YuMaQiShouEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.NumberFormatter;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangYuMaQiShou;
	
	import flash.geom.Point;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.rank.HurtRankSkin;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	/**
	 * 伤害排行活动界面 
	 * @author 陈鹉光
	 * 
	 */	
	public class HurtRankPanel extends SkinUI
	{
		private var _skin:HurtRankSkin;
		private static const TIME:int = int( LanguageConfig.getText( LangYuMaQiShou.TIME ) );
		/** cd时间 **/
		private var _cdTime : int = TIME;
		
		public function HurtRankPanel()
		{
			_skin = new HurtRankSkin();
			super(_skin);
			init();
		}
		
		/**
		 * 初始化 
		 * 
		 */		
		private function init():void
		{
			initList();
			updateRankInfo();
		}
		
		/**
		 *当面板显示时,给子类处理自身逻辑
		 */	
		override protected function onShow():void
		{
			clearData();
			_skin.lbCountDown.visible = false;
			_skin.lbCountDown.htmlText = "";
			_skin.btnGoTo.visible = YuMaQiShouManager.isInBiMaWenActivity();
			
			EventManager.addEvent( RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo );
			EventManager.addEvent( RankEvent.PLUNDER_HURT_RANK_SELF_AMOUNT_CHANGE, updateRankInfo );
			EventManager.addEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_BI_MA_WEN_POS_EVENT, onGotoBiMaWenPoint );
			EventManager.addEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel );
		}
		
		
		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		override protected function onHide():void
		{
			EventManager.removeEvent( RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo );
			EventManager.removeEvent( RankEvent.PLUNDER_HURT_RANK_SELF_AMOUNT_CHANGE, updateRankInfo );
			EventManager.removeEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_BI_MA_WEN_POS_EVENT, onGotoBiMaWenPoint );
			EventManager.removeEvent( YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel );
		}
		
		/**
		 *　更新伤害排行数据
		 * 
		 */		
		private function updateRankInfo():void
		{
			var datas : Array = RankManager.personalHurtRankList;
			if( datas == null || datas.length <= 0 )
			{
				clearData();
			}
			else
			{
				_skin.list.dataProvider.data = datas;
				_skin.list.dataProvider.updateAll();
				var hurtString:String = NumberFormatter.format( RankManager.selfHurtCount, ["万"], [10000], 1 );
				_skin.myHurtTxt.htmlText = LanguageConfig.getText( LangYuMaQiShou.MY_HURT, hurtString );
				_skin.myRankTxt.htmlText = LanguageConfig.getText( LangYuMaQiShou.MY_HURT_INDEX, RankManager.selfRankIndex );
			}
			_skin.btnGoTo.visible = YuMaQiShouManager.isInBiMaWenActivity();
		}
		
		/**
		 * 寻找弼马温 
		 * @param point
		 * 
		 */		
		private function onGotoBiMaWenPoint( point:Point ):void
		{
			RoleStateUtil.walk( MainRoleManager.actor, point.x, point.y, 200 );
		}
		
		/**
		 * 御马场活动结束倒计时 
		 * 
		 */		
		private function onClosePanel():void
		{
			TimerServer.addLoop( updateTime, 1000 );
		}
		
		/**
		 * 倒计时更新 
		 * 
		 */		
		private function updateTime():void
		{
			_cdTime --;
			if ( _cdTime <= 0 && YuMaQiShouManager.isInBiMaWenActivity() )
			{
				_skin.lbCountDown.visible = false;
				_skin.lbCountDown.htmlText = "";
				TimerServer.remove(updateTime);
				_cdTime = TIME;
			}
			else
			{
				_skin.lbCountDown.visible = true;
				_skin.lbCountDown.htmlText = LanguageConfig.getText( LangYuMaQiShou.COUNT_DOWN, _cdTime );
			}
		}
		
		/**
		 * 清空数据显示 
		 * 
		 */		
		private function clearData():void
		{
			_skin.list.dataProvider.data = [];
			_skin.list.dataProvider.updateAll();
			_skin.myHurtTxt.htmlText = LanguageConfig.getText( LangYuMaQiShou.MY_HURT, LanguageConfig.getText( LangYuMaQiShou.WU ) );
			_skin.myRankTxt.htmlText = LanguageConfig.getText( LangYuMaQiShou.MY_HURT_INDEX, LanguageConfig.getText( LangYuMaQiShou.WU ) );
		}
		
		/**
		 * 初始化列表
		 *
		 */
		private function initList() : void
		{
			_skin.list.dataProvider = new ListCollection();
			//ListItem自定义类型
			_skin.list.itemRendererType = HurtRankListItem;
			_skin.list.clipContent = true;
			
			//滚动条显示模式
			_skin.list.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_skin.list.paddingLeft = 4;
			
			//滚动条开关[auto, on, off]
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			//滚动条显示模式
			//一直显示滚动条:fixedFloat|拖动的时候才显示滚动条:float|不显示滚动条，但仍可以拖动:none;
			_skin.list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED_FLOAT;
			_skin.list.verticalScrollStep = 20;
		}
		
		/**
		 * 布局 
		 * @param sWidth
		 * @param sHeight
		 * 
		 */		
		public function resize(sWidth:int, sHeight:int):void
		{
			x = sWidth - this.width;
			y = sHeight;
		}
		
		/**
		 * 显示面板
		 * 
		 */		
		public function show():void
		{
			this.visible = true;
		}
		
		/**
		 * 隐藏面板
		 * 
		 */		
		public function hide():void
		{
			this.visible = false;
		}
		
		/**
		 * 点击事件
		 * @param target
		 *
		 */
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			switch (target)
			{
				case _skin.btnGoTo: //寻找弼马温
				{
					YuMaQiShouSender.requestGetBiMaWenPos();
					break;
				}
				default:
					break;
			}
		}
	}
}