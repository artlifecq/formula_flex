package com.rpgGame.app.view.icon
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import starling.events.TouchEvent;

	/**
	 * 可拖拽格子 
	 * @author wewell@163.com
	 * 
	 */	
	public class DragDropItem extends DragDropGrid
	{
		/**
		 * 真实的下标(格子显示对象实例编号),内部编号,对外只读
		 */	
		private var _realIndex:int;
		
		public function DragDropItem($iconSize:int, realIndex:int)
		{
			super($iconSize);
			_realIndex = realIndex;
			this.touchGroup = false;
		}
		
		/**
		 * 真实的下标(显示对象集合中),只读
		 */		
		public function get realIndex():int
		{
			return _realIndex;
		}
		
		/**
		 *格子信息,携带容器编号及格子下标等数据,永远不能为空 
		 */		
		override public function set gridInfo(value:GridInfo):void
		{
			if(!value)
			{
				trace("[DragDropItem]:gridInfo不能为空");
				return;
			}
			
			_gridInfo = value;
			
			//有效的真实下标
			if(_realIndex >= 0)
			{
				_gridInfo.realIndex = _realIndex;
			}
			
			faceInfo =  _gridInfo.data;
			
//			setBg( GridBGType.CHORTCUT_2 );
			
			if( _gridInfo.data)
			{
				FaceUtil.setGridData(this, faceInfo,  gridInfo.isTips);
			}else{
				setGridEmpty();
				if(_gridInfo.isUnlock)
				{
					setGridUnlock();
				}
			}
			if(_gridInfo.data is ClientItemInfo)
				setIsShowLockAsset(_gridInfo.isShowLockAsset,(_gridInfo.data as ClientItemInfo).binded);
			
			isEnabled = _gridInfo.isEnabled;
		}
		
		private function setGridUnlock():void
		{
//			setBg( GridBGType.CHORTCUT_2_MASK );
//			if(gridInfo.unlockInfo && !TipTargetManager.hasTipsEventListener(this))
//			{
//				TipTargetManager.addTxtTipTarget( this, TargetTipsMaker.makeTips( TipType.OPEN_GRID_TIP, gridInfo.unlockInfo ) );
//			}
		}
		
		
		//-----------------------------------
		/**
		 * 拖动后源格子的变化
		 * 
		 */		
		override protected function dragSourceOutChange():void
		{
//			super.dragSourceOutChange();
			
			isGary = true;
//			clear();
//			TipTargetManager.removeTxtTipTarget(this);
		}
		
		override public function set isGary(value : Boolean) : void
		{
			if (!_gridInfo||_gridInfo.data == null)
				return;
			_isGary=value;
			if (value)
			{
				if(_iconImage){
					GrayFilter.gray(_iconImage);
				}
				if(_qualityImage){
					GrayFilter.gray(_qualityImage);
				}
				if(_lvImage){
					GrayFilter.gray(_lvImage);
				}
				if(_countText){
					GrayFilter.gray(_countText);
				}
				if(_bindImage){
					GrayFilter.gray(_bindImage);
				}
				if(_jobImage){
					GrayFilter.gray(_jobImage);
				}
			}
			else
			{
				if(_iconImage){
					_iconImage.filter=null;
				}
				if(_qualityImage){
					_qualityImage.filter=null;
				}
				if(_lvImage){
					_lvImage.filter=null;
				}
				if(_countText){
					_countText.filter=null;
				}
				if(_bindImage){
					_bindImage.filter=null;
				}
				if(_jobImage){
					_jobImage.filter=null;
				}
			}
		}

		
		/**
		 * 拖动完成表现
		 * 
		 */		
		override protected function dragComplete():void
		{
			super.dragComplete(); 
			onBackComplete();
//			return;
//			if(dropTarget != null)
//			{
//				if(dragSource.containerID == dropTarget.containerID && dragSource.index == dropTarget.index)
//				{
//					dragSourceBack();
//				}
//				else
//				{
//					hideDragSource();
//				}
//				return;
//			}
//			
//			dragSourceBack();
		}
		
		override protected function onBackComplete():void
		{
			super.onBackComplete();
			FaceUtil.setGridData(this, dragSource.gridInfo.data, true);
		}
		
		override protected function onTouchSelect( e:TouchEvent ):void
		{
			if(!this.gridInfo){
				return;
			}
			var data:ClientItemInfo=this.gridInfo.data as ClientItemInfo
			if(!data){
				this.selectImgVisible=false;
				return;
			}
			if(this.gridInfo.containerID!=ItemContainerID.BackPack&&this.gridInfo.containerID!=ItemContainerID.Storage){
				this.selectImgVisible=false;
				return;
			}
			super.onTouchSelect(e);
		}
		
		override public function setJobState(state:String):void
		{
			if(this.gridInfo.containerID!=ItemContainerID.BackPack&&this.gridInfo.containerID!=ItemContainerID.Storage){
				if(_jobImage && _jobImage.parent)
					_jobImage.parent.removeChild(_jobImage);
				_jobImage = null;
				return;
			}
			
			super.setJobState(state);
		}
		
		override protected function dragSourceBack():void
		{
			super.dragSourceBack();
//			var pos:Point = this.parent.localToGlobal(new Point(this.x, this.y));
//			TweenLite.to(dragSource,0.5,{x:pos.x, y:pos.y, onComplete:onBackComplete});
		}
		
	}
}