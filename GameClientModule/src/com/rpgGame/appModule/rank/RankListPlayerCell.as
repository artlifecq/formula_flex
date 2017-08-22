package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.top.bean.TopInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.ButtonState;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Item;
	
	import starling.display.DisplayObject;
	
	public class RankListPlayerCell extends DefaultListItemRenderer
	{
		private static const HELPER_POINT : Point = new Point();
		private var _skin:PaiHang_Item;
		private var _topInfo:TopInfo;

		public function get topInfo():TopInfo
		{
			return _topInfo;
		}

		private var _triggeredFun:Function;
		public function RankListPlayerCell(calFun:Function):void
		{
			_triggeredFun = calFun;
			super();
			init();
		}
		
		protected function init():void
		{
			_skin = new PaiHang_Item();
			_skin.toSprite(this);
			_skin.uiOver.touchable = false;
		}
		
		public function updatCellByInfo(type:int,info:TopInfo):void
		{
			if(info == null||(type!= info.toptype))
			{
				_skin.lbNum.visible = false;
				_skin.icon.visible = false;
				_skin.vip.visible = false;
				_skin.lbName.visible = false;
				_skin.lbZhiye.visible = false;
				_skin.lbContent.visible = false;
				_skin.uiOver.visible = false;
				_topInfo = null;
				return ;
			}else{
				_skin.vip.visible = true;
				_skin.lbName.visible = true;
				_skin.lbZhiye.visible = true;
				_skin.lbContent.visible = true;
			}
			_topInfo = info;
			if(info.rank<=3&&info.rank>0)
			{
				_skin.lbNum.visible = false;
				_skin.icon.visible = true;
				_skin.icon.styleName = "ui/app/paihangbang/"+info.rank+".png";
			}else{
				_skin.icon.visible = false;
				_skin.lbNum.visible = true;
				_skin.lbNum.text = info.rank.toString();
			}
			
			_skin.vip.visible = info.vipId>0;
			if(_skin.vip.visible){
				_skin.vip.styleName = "ui/common/tubiao/vips"+info.vipId+".png";
			}
			//不要显示[]
			var tname:String=info.playername;
			var index:int=tname.indexOf("]");
			if (index!=-1) 
			{
				tname=tname.substr(index+1);
			}
			_skin.lbName.text =tname;
			_skin.lbZhiye.text = ItemUtil.getJobName(info.playerBriefInfo.job);
			if(info.toptype == RankListType.MOUNT_TYPE)
			{
				var horsedata:Q_horse = HorseConfigData.getMountDataById(info.param);
				if(horsedata!=null)
				{
					_skin.lbContent.text = horsedata.q_name+"."+horsedata.q_id.toString()+"阶";
				}else{
					_skin.lbContent.text = "无";
				}
			}else if(info.toptype == RankListType.WARFLAG_TYPE){
				var warflag:Q_warflag=ZhanQiConfigData.getZhanQiDataById(info.param);
				if(warflag!=null)
				{
					_skin.lbContent.text = warflag.q_name+"."+warflag.q_id.toString()+"阶";
				}else{
					_skin.lbContent.text = "无";
				}
			}else{
				_skin.lbContent.text = info.param.toString();
			}
		}
		
		override public function set color(value:uint):void
		{
			_skin.lbNum.color = value;
			_skin.lbName.color = value;
			_skin.lbZhiye.color = value;
			_skin.lbContent.color = value;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.lbName)
			{
				var uise:*= _topInfo.playerid.hexValue;
				var userName : String = _topInfo.playername;
				if(!MainRoleManager.isSelf(_topInfo.playerid.ToGID()))
				{
					MenuManager.showMenu(MenuUtil.getPlayerTargetRank(), [uise, userName], -1, -1, 80);
				}
			}else{
				if(_triggeredFun!=null)
				{
					_triggeredFun(_topInfo);
				}
			}
		}
		private var _isSelect:Boolean;
		public function chackItem(topInfo:TopInfo):void
		{
			if(_topInfo==null)
				return ;
			_isSelect = (_topInfo == topInfo);
			_skin.uiOver.visible = _isSelect;
		}
		
		override protected function changeState(state:String):void
		{
			if(_topInfo==null)
				return ;
			super.changeState(state);
			if(_isSelect)
			{
				_skin.uiOver.visible = _isSelect;
			}else{
				_skin.uiOver.visible = !(state==ButtonState.UP);
			}
			
		}
	}
}