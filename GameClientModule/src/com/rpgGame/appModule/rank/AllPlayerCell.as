package com.rpgGame.appModule.rank
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.top.bean.TopInfo;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Item2;
	
	import starling.display.DisplayObject;
	
	public class AllPlayerCell extends SkinUI
	{
		private var _skin:PaiHang_Item2;
		private var _triggeredFun:Function;
		public function AllPlayerCell(calFun:Function):void
		{
			_triggeredFun = calFun;
			_skin = new PaiHang_Item2();
			super(_skin);
		}
		private var _topInfo:TopInfo;
		
		public function get topInfo():TopInfo
		{
			return _topInfo;
		}
		public function updatCellByInfo(info:TopInfo):void
		{
			if(info == null)
			{
				_skin.lbNum.visible = false;
				_skin.icon.visible = false;
				_skin.vip.visible = false;
				_skin.lbName.visible = false;
				_skin.lbLevel.visible = false;
				_skin.lbZhiye.visible = false;
				_skin.lbContent.visible = false;
				_topInfo = null;
				return ;
			}else{
				_skin.vip.visible = true;
				_skin.lbName.visible = true;
				_skin.lbZhiye.visible = true;
				_skin.lbContent.visible = true;
			}
			_topInfo = info;
			if(info.rank<=3)
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
			_skin.lbName.text = info.playername;
			_skin.lbZhiye.text = ItemUtil.getJobName(info.job);
			if(info.toptype == RankListType.MOUNT_TYPE)
			{
				var horsedata:Q_horse = HorseConfigData.getMountDataById(info.param);
				if(horsedata!=null)
				{
					_skin.lbContent.text = horsedata.q_name+"."+horsedata.q_id.toString();
				}else{
					_skin.lbContent.text = "无";
				}
			}else if(info.toptype == RankListType.WARFLAG_TYPE){
				var warflag:Q_warflag=ZhanQiConfigData.getZhanQiDataById(info.param);
				if(warflag!=null)
				{
					_skin.lbContent.text = warflag.q_name+"."+warflag.q_id.toString();
				}else{
					_skin.lbContent.text = "无";
				}
			}else{
				_skin.lbContent.text = info.param.toString();
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(_triggeredFun!=null)
			{
				_triggeredFun(_topInfo);
			}
		}
	}
}