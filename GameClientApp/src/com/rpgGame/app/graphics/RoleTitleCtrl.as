package com.rpgGame.app.graphics
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.graphics.decor.DecorCtrl;
	import com.rpgGame.app.graphics.title.IBaseTitle;
	import com.rpgGame.app.graphics.title.RoleEffectTitle;
	import com.rpgGame.app.graphics.title.RoleUITitle;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.TitleControlCfg;
	import com.rpgGame.coreData.clientConfig.Q_title_control;
	
	import org.mokylin.skin.app.maps.ThansName;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 *游戏头顶称号统一管理 
	 * @author yfl
	 * 
	 */	
	public class RoleTitleCtrl extends Sprite
	{
		private var _titleHash:HashMap=new HashMap();
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
			var tmp:HashMap=new HashMap();
			var len:int=_tiles.length;
			var qTitle:Q_title_control;
			for (var i:int = 0; i <len; i++) 
			{
				qTitle=TitleControlCfg.getTitle(_tiles[i]);
				var old:Q_title_control=tmp.getValue(qTitle.q_type);
				if (!old||old.q_id<qTitle.q_id) 
				{
					tmp.put(qTitle.q_type,qTitle);
				}
			}
			var arr:Array=tmp.values();
			//升序id越低，称号约在底
			arr.sortOn("q_q_weight",Array.NUMERIC);
			len=arr.length;
			for (var j:int = 0; j < len; j++) 
			{
				addTitle(arr[j]);
			}
			
		}
		private function addTitle(qTitle:Q_title_control,bSort:Boolean=false):void
		{
			if (!qTitle) 
			{
				return;
			}
			var old:IBaseTitle=_titleHash.getValue(qTitle.q_type);
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
				_titleHash.remove(qTitle.q_title);
				MCUtil.removeSelf(old as DisplayObject);
				old=null;
			}
			if (qTitle.q_effects) 
			{
				old=new RoleEffectTitle();
			}
			else if (qTitle.q_title) 
			{
				old=new RoleUITitle();
			}
			if (!old) 
			{
				GameLog.addError("qtile error"+qTitle.q_id);
			}
			old.playEffect(_owt,qTitle);
			this.addChild(old as DisplayObject);
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
			var iTitle:IBaseTitle=_titleHash.remove(titleId);
			if (iTitle) 
			{
				MCUtil.removeSelf(iTitle as DisplayObject);
				sortTitle();
			}
		}
		private function onSort(aTile:IBaseTitle,bTile:IBaseTitle):int
		{
			if (aTile.data.q_weight<bTile.data.q_weight) 
			{
				return -1;
			}
			else if (aTile.data.q_weight>bTile.data.q_weight) 
			{
				return 1;
			}
			return 0;
		}
		private function sortTitle():void
		{
			var tiles:Array=_titleHash.values();
			tiles.sort(onSort);
			var len:int=tiles.length;
			_th=0;
			var tmp:IBaseTitle;
			for (var i:int = 0; i < len; i++) 
			{
				tmp=tiles[i];
				_th=tmp.height+2;
				tmp.y=-_th;
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
		override public function dispose():void
		{
			super.dispose();
			MCUtil.removeAllChild(this);
			_titleHash.clear();
			_th=0;
			MCUtil.removeSelf(this);
		}
	}
}