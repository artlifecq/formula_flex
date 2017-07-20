package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.RankListManager;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.netData.top.bean.TopInfo;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	
	import away3d.events.Event;
	
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip2_Skin;

	public class AllRankLeftGroup
	{
		private var _content:Group;
		private var _cellList:Vector.<AllPlayerCell>;
		private var _selfCell:AllPlayerCell;
		private var _type:int;
		private var _length:int;
		protected var _rightGroup:RightGroupBase;
		public function AllRankLeftGroup(content:Group,type:int):void
		{
			_content = content;
			_type = type;
			initView();
		}
		
		private var _bindLable:Label;
		private var _bindImg:UIAsset;
		
		public function bindUI(lab:Label,img:UIAsset):void
		{
			_bindLable = lab;
			_bindImg = img;
		}
		
		public function bindRightGroup(content:SkinnableContainer):void
		{
			if(_rightGroup!=null)
				return ;
			_rightGroup = new RightGroupBase(content.skin as PaiHang_Right,_type);
		}
		private function initView():void
		{
			_cellList = new Vector.<AllPlayerCell>();
			_length = RankListManager.instance.getcellLength(_type);
			for(var i:int = 0;i<_length;i++)
			{
				var cell:AllPlayerCell = new AllPlayerCell(triggeredHandler);
				cell.y = i*31;
				cell.updatCellByInfo(null);
				_content.addChild(cell);
				_cellList.push(cell);
			}
			_selfCell = new AllPlayerCell(triggeredHandler);
			_selfCell.updatCellByInfo(null);
			_content.addChild(_selfCell);
			if(_type == RankListType.All_COMBATPOWER_TYPE)
				_selfCell.y = 397;
			else
				_selfCell.y = 304;
		}
		
		private var _selectinfo:TopInfo;
		private function triggeredHandler(info:TopInfo):void
		{
			if(_selectinfo == info)
				return ;
			_selectinfo = info;
			_rightGroup.updateModle(info);
		}
		protected var _totalPage:int;
		protected var _currentPage:int;
		public function requestPage():void
		{
			RankListManager.instance.requestRankTypeInfo(_type,_currentPage);
		}
		
		public function onShow():void
		{
			_currentPage = 0;
			addEvent();
			requestPage();
			refeashPageValue();
		}
		
		public function onHide():void
		{
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
			_totalPage = Math.floor(msg.length/_length);
			
			_selfCell.updatCellByInfo(msg.meTopInfo);
			refeashPageValue();
		}
		
		private function updataPageInfoHandler():void
		{
			var cell:AllPlayerCell
			for(var i:int = 0;i<_length;i++)
			{
				cell = _cellList[i];
				cell.updatCellByInfo(RankListManager.instance.getRankListInfoByIndex(_type,i));
			}
			triggeredHandler(_cellList[0].topInfo);
		}
		private var _flip:Flip2_Skin;
		public function bindPageBtn(flip:Flip2_Skin):void
		{
			_flip = flip;
			_flip.btnAdd.addEventListener(Event.TRIGGERED,addValueHandler);
			_flip.btnDec.addEventListener(Event.TRIGGERED,decValueHandler);
			_flip.btnMax.addEventListener(Event.TRIGGERED,decValueHandler);
			_flip.btnMin.addEventListener(Event.TRIGGERED,decValueHandler);
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
		
		private function maxValueHandler():void
		{
			_currentPage = _totalPage;
			requestPage();
			refeashPageValue();
		}
		
		private function minValueHandler():void
		{
			_currentPage =0;
			requestPage();
			refeashPageValue();
		}
		private function refeashPageValue():void
		{
			_flip.btnDec.visible =_flip.btnMin.visible = _currentPage>0;
			_flip.btnAdd.visible =_flip.btnMax.visible= _currentPage<_totalPage;
			_flip.textDisplay.text = int(_currentPage+1).toString()+"/"+int(_totalPage+1).toString();
		}
	}
}