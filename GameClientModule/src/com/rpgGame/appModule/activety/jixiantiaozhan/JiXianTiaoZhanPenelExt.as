package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.activety.ActivetyPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	
	import gs.TweenMax;
	import gs.easing.Back;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianTiaoZhan;
	import org.mokylin.skin.common.Flip1_Skin;
	
	import starling.display.DisplayObject;
	
	/**极限挑战面板
	 * @ gnw 2017.6.20
	 * */
	public class JiXianTiaoZhanPenelExt extends ViewUI
	{
		private var _skin:JiXianTiaoZhan;
		
		private const MAX_SHOW_NUM:int=10;
		
		private var _prizeItem:DragDropItem;
		private var _jixianItemList:Vector.<JiXianTiaoZhanItem>;
		
		private var _indexTAB:int=1;
		private var _maxTAB:Number=1;
		private var _bossDamageInfos:Vector.<BossDamageInfo>;
		
		public function JiXianTiaoZhanPenelExt()
		{
			_skin = new JiXianTiaoZhan();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_jixianItemList=new Vector.<JiXianTiaoZhanItem>();
			//最后一击奖励
			_skin.icon.visible=false;
			var _render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,GridBGType.GRID_SIZE_48);
			_prizeItem=_render.getGrid();
			_prizeItem.gridInfo=new GridInfo(0,0);
			_skin.container.addChild(_prizeItem);
			_prizeItem.x = _skin.icon.x;
			_prizeItem.y = _skin.icon.y;
			var reward:Array=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_join_rewards);
			var clientItemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(reward[0].mod,reward[0].num);
			FaceUtil.SetItemGrid(_prizeItem, clientItemInfo);
			
			//boss伤害排名
			for(var i:int=0;i<MAX_SHOW_NUM;i++)
			{
				var item:JiXianTiaoZhanItem=new JiXianTiaoZhanItem();
				item.setPoint(0,i*item.height);
				_jixianItemList.push(item);
				_skin.container_list.addChild(item);
			}
			_skin.lbDec.leading=5;
			_skin.lbDec.text=ActivetyDataManager.jixianVo.qmod.q_rules;
			_skin.lbDec.isHtmlText=true;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_enter:
					enterBtnHandler();
					break;
				case (_skin.skinFlip.skin as Flip1_Skin).btnDec:
					decBtnHandler();
					break;
				case (_skin.skinFlip.skin as Flip1_Skin).btnAdd:
					addBtnHandler();
					break;
			}			
		}
		
		override public function show(data:Object=null):void
		{
			super.show();
			initEvent();
			updateShow();
			ActivetyPanel(this.parent).showPaiHang();
		}	
		
		override public function hideView():void
		{
			super.hideView();
			removeEvent();
			JiXianTiaozhanPaiHnagPenelExt.hidePanel();
//			_prizeItem.clear();
		}
		
		private function initEvent():void
		{
			
		}
		
		private function removeEvent():void
		{
			
		}
		
		private function updateShow():void
		{
			_skin.lbBossKill.text = ActivetyDataManager.jixianVo.killName!=null?ActivetyDataManager.jixianVo.killName:"暂无";
			_bossDamageInfos=ActivetyDataManager.jixianVo.bossDamageInfos;
			_indexTAB = 1;
			_maxTAB = Math.max(Math.ceil(ActivetyDataManager.jixianVo.bossDamageInfos.length/MAX_SHOW_NUM),1);;
			updateshowList(getShowList(_indexTAB));
			updateTABShow();		
			
			_skin.lbPaiMing.text=(ActivetyDataManager.jixianVo.rank>0?ActivetyDataManager.jixianVo.rank.toString():"暂无");
			_skin.lbShangHai.text=(ActivetyDataManager.jixianVo.damage>0?ActivetyDataManager.jixianVo.damage.toString():"暂无");
		}
		
		private function getShowList(tab:int):Vector.<BossDamageInfo>
		{
			var list:Vector.<BossDamageInfo>=new Vector.<BossDamageInfo>();
			for(var i:int=0;i<_bossDamageInfos.length;i++)
			{
				if(i>=((tab-1)*MAX_SHOW_NUM)&&i<tab*MAX_SHOW_NUM)
				{
					list.push(_bossDamageInfos[i]);
				}
			}
			return list;
		}
		
		private function updateshowList(infos:Vector.<BossDamageInfo>):void
		{
			var len:int=infos.length;
			for(var i:int = 0;i < MAX_SHOW_NUM;i ++)
			{
				if(i<len)
				{
					_jixianItemList[i].setData(i,infos[i]);
					_jixianItemList[i].visible=true;
				}
				else
				{
					_jixianItemList[i].setData(i,null);
					_jixianItemList[i].visible=false;
				}
			}
			tweenToUp();
		}
		
		private function tweenToUp():void
		{
			for (var i:int = 0; i < _jixianItemList.length; ++i)
			{
				_jixianItemList[i].x =0;
				_jixianItemList[i].y =i*_jixianItemList[i].initY+30;
				_jixianItemList[i].alpha = 0;
				TweenMax.to(_jixianItemList[i], 0.2, {delay:0.1 * i, alpha:1, y:i*_jixianItemList[i].initY, ease:Back.easeOut});
			}
		}
		
		private function updateTABShow():void
		{
			if(_maxTAB==1)
			{
				(_skin.skinFlip.skin as Flip1_Skin).btnDec.visible=false;
				(_skin.skinFlip.skin as Flip1_Skin).btnAdd.visible=false;
			}
			else if(_indexTAB==1&&_maxTAB>1)
			{
				(_skin.skinFlip.skin as Flip1_Skin).btnDec.visible=false;
				(_skin.skinFlip.skin as Flip1_Skin).btnAdd.visible=true;
			}
			else if(_indexTAB==_maxTAB&&_maxTAB>1)
			{
				(_skin.skinFlip.skin as Flip1_Skin).btnDec.visible=true;
				(_skin.skinFlip.skin as Flip1_Skin).btnAdd.visible=false;
			}
			else
			{
				(_skin.skinFlip.skin as Flip1_Skin).btnDec.visible=true;
				(_skin.skinFlip.skin as Flip1_Skin).btnAdd.visible=true;
			}
			(_skin.skinFlip.skin as Flip1_Skin).textDisplay.text=_indexTAB.toString()+"/"+_maxTAB;
		}
		
		private function decBtnHandler():void
		{
			if(_indexTAB>0)
			{
				_indexTAB--;
				updateshowList(getShowList(_indexTAB));
				updateTABShow();
			}
		}
		
		private function addBtnHandler():void		
		{
			if(_indexTAB<_maxTAB)
			{
				_indexTAB++;
				updateshowList(getShowList(_indexTAB));
				updateTABShow();
			}
		}
		
		private function enterBtnHandler():void
		{
			var info:ActivetyInfo = ActivetyCfgData.getActInfoById(ActivetyDataManager.jixianVo.activityid);
			if(info.info.joinState==0||info.info.joinState==1){
				NoticeManager.showNotifyById(70006);
				return;
			}
			if(info.info.joinState==4){
				NoticeManager.showNotifyById(70007);
				return;
			}
			SpecialActivitySender.reqJoinAct(info.info.activityId);
		}
	}
}