package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.RankListManager;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.top.bean.TopInfo;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip1_Skin;

	public class RankListViewBase extends SkinUI
	{
		protected var _type:int;
		protected var _cellGroup:Group;
		protected var _rightGroup:RightGroupBase;
		private var _cellList:Vector.<RankListPlayerCell>;
		private var _selfCell:RankListPlayerCell;
		protected var _uiTongjizhong:UIAsset;
		public function RankListViewBase(skin : StateSkin,type:int):void
		{
			_type = type;
			super(skin);
			initstance();
		}
		
		protected function bindRightGroup(content:SkinnableContainer):void
		{
			if(_rightGroup!=null)
				return ;
			_rightGroup = new RightGroupBase(content.skin as PaiHang_Right,_type);
		}
		protected function initstance():void
		{
			_cellList = new Vector.<RankListPlayerCell>();
			for(var i:int = 0;i<RankListManager.PageListLength;i++)
			{
				var cell:RankListPlayerCell = new RankListPlayerCell(triggeredHandler);
				cell.y = i*31;
				cell.updatCellByInfo(_type,null);
				_cellGroup.addChild(cell);
				_cellList.push(cell);
			}
			
			_selfCell = new RankListPlayerCell(triggeredHandler);
			_selfCell.color(0x55bd15);
			_selfCell.y = 397;
			_selfCell.updatCellByInfo(_type,null);
			_cellGroup.addChild(_selfCell);
			_uiTongjizhong.visible = true;
		}
		private var _selectinfo:TopInfo;
		private function triggeredHandler(info:TopInfo):void
		{
			if(_selectinfo == info)
				return ;
			_selectinfo = info;
			_rightGroup.updateModle(info);
		}
		override protected function onShow():void
		{
			super.onShow();
			_currentPage = 0;
			addEvent();
			requestPage();
			refeashPageValue();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(RankListEvent.UPDATATYPEINFO,updataTypeInfoHandler);
			EventManager.removeEvent(RankListEvent.UPDATAEVERYPAGELIST,updataPageInfoHandler);
		}
		
		private function addEvent():void
		{
			EventManager.addEvent(RankListEvent.UPDATATYPEINFO,updataTypeInfoHandler);
			EventManager.addEvent(RankListEvent.UPDATAEVERYPAGELIST,updataPageInfoHandler);
		}
		
		private function updataTypeInfoHandler(msg:ResToplistToClientMessage):void
		{
			_totalPage = Math.floor(msg.length/RankListManager.PageListLength);
			if(_uiTongjizhong!=null)
			{
				_uiTongjizhong.visible = msg.length<=0;
			}
			
			_selfCell.updatCellByInfo(_type,msg.meTopInfo);
			refeashPageValue();
		}
		
		private function updataPageInfoHandler():void
		{
			var cell:RankListPlayerCell
			for(var i:int = 0;i<RankListManager.PageListLength;i++)
			{
				cell = _cellList[i];
				cell.updatCellByInfo(_type,RankListManager.instance.getRankListInfoByIndex(_type,i));
			}
			triggeredHandler(_cellList[0].topInfo);
		}
		
		private var _btnAll:Button;
		protected function bindBtnAll(btn:Button):void
		{
			if(_btnAll!=null)
			{
				_btnAll.removeEventListener(Event.TRIGGERED,allTriggeredHandler);
			}else{
				_btnAll = btn;
				_btnAll.addEventListener(Event.TRIGGERED,allTriggeredHandler);
			}
		}
		private function allTriggeredHandler(e:Event):void
		{
			FunctionOpenManager.openAppPaneById(EmFunctionID.EM_AllCOMBATPOWERRANK);
		}
		
		protected var _totalPage:int;
		protected var _currentPage:int;
		public function requestPage():void
		{
			RankListManager.instance.requestRankTypeInfo(_type,_currentPage);
		}
		
		private var _flip:Flip1_Skin
		protected function bindPageBtn(flip:Flip1_Skin):void
		{
			_flip = flip;
			_flip.btnAdd.addEventListener(Event.TRIGGERED,addValueHandler);
			_flip.btnDec.addEventListener(Event.TRIGGERED,decValueHandler);
		}
		
		private function addValueHandler():void
		{
			_currentPage++;
			requestPage();
			refeashPageValue();
		}
		
		private function decValueHandler():void
		{
			_currentPage--;
			requestPage();
			refeashPageValue();
		}
		
		private function refeashPageValue():void
		{
			_flip.btnDec.visible = _currentPage>0;
			_flip.btnAdd.visible = _currentPage<_totalPage;
			_flip.textDisplay.text = int(_currentPage+1).toString()+"/"+int(_totalPage+1).toString();
		}
		
		protected function refeashModle(info:TopInfo):void
		{
			
		}
		
	}
}