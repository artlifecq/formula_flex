package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.netData.dianfeng.bean.DianFengRankInfo;
	
	import org.mokylin.skin.app.zhanchang.paihangbang.PaiHang_Item;
	
	import starling.display.DisplayObject;
	
	public class D1v1RankCellExt extends SkinUI 
	{
		private static var pool:Vector.<D1v1RankCellExt>=new Vector.<D1v1RankCellExt>();
		public static var clickCall:Function;
		private var _skin:PaiHang_Item;
		private var isMouseOut:Boolean;
		private var _data:DianFengRankInfo;
		public function D1v1RankCellExt(index:int)
		{
			_skin=new PaiHang_Item();
			super(_skin);
			_skin.bg1.touchable=true;
			//_skin.bg1.visible=index%2==0;
			//_skin.bg2.visible=!_skin.bg1.visible;
			//_skin.lbId.width=50;
			//_skin.bg3.visible=false;
			_skin.selectBg.visible=false;	
			_skin.hoverBg.visible=false;
			var touch:TouchCtrl=new TouchCtrl(this,null,onOver,onOut);
		}
		
		private function onOut():void
		{
			// TODO Auto Generated method stub
			_skin.hoverBg.visible=false;
		}
		
		private function onOver():void
		{
			// TODO Auto Generated method stub
			_skin.hoverBg.visible=true;
		}
		public function setSelect(bool:Boolean):void
		{
			_skin.selectBg.visible=bool;	
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (!_data) 
			{
				return;
			}
			//我自己
			if (_data.playerId.EqualTo(MainRoleManager.serverID)) 
			{
				return;
			}
			if (clickCall) 
			{
				clickCall(this);
			}
		}
		public function isMy(bool:Boolean):void
		{
			if (bool) 
			{
				//_skin.bg1.visible=false;
				//_skin.bg2.visible=false;
				
			//	_skin.bg3.visible=true;
			}
		}
		public function setData(data:*):void
		{
			_data=data;
			if (_data.rank>100||_data.rank<1) 
			{
				_skin.lbId.text=NotifyCfgData.getNotifyTextByID(61028);
			}
			else
			{
				_skin.lbId.text=_data.rank+"";
			}
			if (_data.rank>0&&_data.rank<4) 
			{
				
				_skin.icon.styleName="ui/app/paihangbang/"+_data.rank+".png";
				_skin.icon.visible=true;
				_skin.lbId.visible=false;
			}
			else
			{
				_skin.icon.visible=false;
				_skin.lbId.visible=true;
			}
			_skin.uiVip.visible=_data.vipLevel>0;
			if (_data.vipLevel>0) 
			{
				_skin.uiVip.styleName="ui/app/zhanchang/paihangbang/vip"+_data.vipLevel+".png";
			}
//			_skin.uiMan.visible=_data.playerAppearanceInfo.sex==1;
//			_skin.uiWoman.visible=_data.playerAppearanceInfo.sex==2;
			_skin.lbName.text=_data.playerName;
			var qRank:Q_battle_rank=BattleRankCfg.getRank(_data.level);
			if (qRank) 
			{
				_skin.lbLevel.text=qRank.q_subrank_name;
			}
			_skin.lbJifen.text=_data.currentIntegral+"";
			this.visible=true;
			_skin.hoverBg.visible=false;
		}
		public static function gain(index:int):D1v1RankCellExt
		{
			if (pool.length>0) 
			{
				return pool.pop();
			}
			return new D1v1RankCellExt(index);
		}
		public static function revert(cell:D1v1RankCellExt):void
		{
			pool.push(cell);
		}

		public function get data():DianFengRankInfo
		{
			return _data;
		}
		public function clearData():void
		{
			_data=null;
			this.visible=false;
		}
	}
}