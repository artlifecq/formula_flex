package com.rpgGame.app.graphics
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.graphics.decor.DecorCtrl;
	import com.rpgGame.app.graphics.title.IBaseTitle;
	import com.rpgGame.app.graphics.title.RoleEffectTitle;
	import com.rpgGame.app.graphics.title.RoleUITitle;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.TitleControlCfg;
	import com.rpgGame.coreData.clientConfig.Q_title_control;
	
	import feathers.core.IFeathersControl;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 *游戏头顶称号显示统一管理 
	 * @author yfl
	 * 
	 */	
	public class RoleTitleCtrl extends Sprite
	{
		private var _curShowHash:HashMap=new HashMap();
		private var _tileHash:HashMap=new HashMap();
		private var _deCtrl:DecorCtrl;
		private var _th:int;
		private var _owt:String;
		public function RoleTitleCtrl(ctrl:DecorCtrl,ownerType:String)
		{
			super();
			this._owt=ownerType;
			this._deCtrl=ctrl;
		}
		public function setTileData(_tiles:Vector.<int>):void
		{
			clearData();
			
			var len:int=_tiles.length;
			var qTitle:Q_title_control;
			for (var i:int = 0; i <len; i++) 
			{
				qTitle=TitleControlCfg.getTitle(_tiles[i]);
				var arr:Array=_tileHash.getValue(qTitle.q_type);
				if (!arr) 
				{
					arr=[];
					_tileHash.put(qTitle.q_type,arr);
				}
				arr.push(qTitle);
			}
			_tileHash.eachValue(sortSameType);
			
			
			//所有称号
			var allArr:Array=_tileHash.values();
			//把每组最牛逼的取出来
			len=allArr.length;
			var tmp:Array=[];
			for (var k:int = 0; k <len; k++) 
			{
				if (allArr[k].lenght) 
				{
					tmp.push(allArr[k][0]);
				}
			}
			len=tmp.length;
			for (var j:int = 0; j < len; j++) 
			{
				addTitle(tmp[j]);
			}
			
		}
		private function sortSameType(arr:Array):void
		{
			arr.sortOn("q_id",Array.NUMERIC|Array.DESCENDING);
		}
		private function addTitle(qTitle:Q_title_control,bSort:Boolean=false):void
		{
			if (!qTitle) 
			{
				return;
			}
			var arr:Array=_tileHash.getValue(qTitle.q_type);
			if (!arr) 
			{
				arr=[];
				_tileHash.put(qTitle.q_type,arr);
			}
			if (arr.indexOf(qTitle)==-1) 
			{
				arr.push(qTitle);
				sortSameType(arr);
			}
			var old:IBaseTitle=_curShowHash.getValue(qTitle.q_type);
			if (old) 
			{
				var oldData:Q_title_control=old.data;
				//有同样的,或者存在更高级的
				if (oldData.q_id>=qTitle.q_id) 
				{
					return;
				}
			}
			//需要新加或者改表
			if (old) 
			{
				_curShowHash.remove(qTitle.q_title);
				MCUtil.removeSelf(old as DisplayObject);
				old.dispose();
				old=null;
			}
			if (qTitle.q_effects) 
			{
				old=new RoleEffectTitle();
			}
//			else if (qTitle.q_title) 
//			{
//				old=new RoleUITitle();
//			}
			if (!old) 
			{
				GameLog.addError("qtile error"+qTitle.q_id);
				return;
			}
			old.playEffect(_owt,qTitle);
			this.addChild(old as DisplayObject);
			_curShowHash.put(qTitle.q_type,old);
			if (bSort) 
			{
				sortTitle();
			}
		}
		public function addTitleById(titleId:int):void
		{
			addTitle(TitleControlCfg.getTitle(titleId),true);
		}
		public function removeTitle(titleId:int):void
		{
			var qTile:Q_title_control=TitleControlCfg.getTitle(titleId);
			if (!qTile) 
			{
				return;
			}
			//移除数据
			var arr:Array=_tileHash.getValue(qTile.q_type);
			if (!arr) 
			{
				arr=[];
				_tileHash.put(qTile.q_type,arr);
			}
			var find:int=arr.indexOf(qTile);
			if (find!=-1) 
			{
				arr.removeAt(find);
			}
			var iTitle:IBaseTitle=_curShowHash.getValue(qTile.q_type);
			if (iTitle&&iTitle.data.q_id==titleId) 
			{
				_curShowHash.remove(qTile.q_type);
				iTitle.dispose();
				MCUtil.removeSelf(iTitle as DisplayObject);
				//还有低级的
				if (arr.length>0) 
				{
					addTitle(arr[0],true);
				}
				else
				{
					sortTitle();
				}
			}
		}
		private function onSort(aTile:IBaseTitle,bTile:IBaseTitle):int
		{
			if (aTile.data.q_weight>bTile.data.q_weight) 
			{
				return -1;
			}
			else if (aTile.data.q_weight<bTile.data.q_weight) 
			{
				return 1;
			}
			return 0;
		}
		private function sortTitle():void
		{
			var tiles:Array=_curShowHash.values();
			tiles.sort(onSort);
			var len:int=tiles.length;
			_th=0;
			var tmp:IBaseTitle;
			for (var i:int = 0; i < len; i++) 
			{
				tmp=tiles[i];
				tmp.y=_th;
				_th+=tmp.height+2;
				
			}
			if (_deCtrl) 
			{
				_deCtrl.sortTop();
			}
		}
		override public function get height():Number
		{
			return _th;
		}
		override public function get width():Number
		{
			return 0;
		}
		private function clearData():void
		{
			MCUtil.removeAllChild(this);
			_curShowHash.eachValue(function (title:IBaseTitle):void{
				title.dispose();			
			});
			_curShowHash.clear();
			_th=0;
			_tileHash.clear();
		}
		override public function dispose():void
		{
			clearData();
			MCUtil.removeSelf(this);
			super.dispose();
		}
	}
}