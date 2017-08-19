package com.rpgGame.app.ui.main.buff
{
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 *buff格子统一排列 
	 * @author yfl
	 * 
	 */	
	public class BuffGridCon extends Sprite
	{
		private var _type:String;
		private var _buffList:Vector.<BuffIcon>=new Vector.<BuffIcon>();
		private var _size:int;
		/**水平排列方式，0：左→右，1：右-左**/
		private var _hAlin:int;
		/**锤子排列方式，0：上→下，1：下-上**/
		private var _vAlin:int;
		private var _lineCount:int;
		private var W:int=0;
		/**
		 *buff 格子容器 
		 * @param t
		 * @param size 格子大小
		 * @param lineCount 一行多少个
		 * @param halin 水平布局
		 * @param valin 垂直布局
		 * 
		 */		
		public function BuffGridCon(t:String,size:int,lineCount:int,halin:int,valin:int)
		{
			super();
//			this.graphics.beginFill(0);
//			this.graphics.drawRect(0,0,20,20);
//			this.graphics.endFill();
			this._type=t;
			this._size=size;
			this._hAlin=halin;
			this._vAlin=valin;
			this._lineCount=lineCount;
			W=size+9;
			
		}
		public function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isExist(data))
			{
				return;
			}
			var isShowBG:Boolean=(data.buffData.q_buff_id==9||data.buffData.q_buff_id==10);
			var icon:BuffIcon=new BuffIcon(_size,!isShowBG);
			icon.buffData=data;
			icon.setUrlBg("ui/mainui/head/BAFF/buffBg_20.png");
			this.addChild(icon);
			_buffList.push(icon);
			setIcoPos(icon,_buffList.length-1);
		}
		public function removeForDatas(buffData:BuffData):void
		{
			var icon:BuffIcon;
			var num:int,i:int;
			num=_buffList.length;
			for  (i=0;i<num;i++) 
			{
				icon=_buffList[i];
				if(icon.buffData.buffData.q_buff_id==buffData.buffData.q_buff_id)
				{
					icon.dispose();
					_buffList.splice(i,1);
					sort();
					break;
				}
			}
		}
		private function isExist(data:BuffData):Boolean
		{
			var icon:BuffIcon;
			var num:int=_buffList.length;
			for(var i:int=0;i<num;i++)
			{
				icon=_buffList[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id)
				{
					icon.buffData=data;
					return true;
				}
			}
			return false;
		}
		/**单独提出来**/
		private function setIcoPos(dis:DisplayObject,i:int):void
		{
			var tmpX:int;
			var tmpY:int;
			//左到右，x从0开始
			if (_hAlin==0) 
			{
				tmpX=(i%_lineCount)*W;
			}
				//x 从-w开始
			else  
			{
				tmpX=-W-(i%_lineCount)*W;
			}
			//上到下 y开始
			if (_vAlin==0) 
			{
				tmpY=int(i/_lineCount)*W;
			}
				//下到上 -W开始
			else 
			{
				tmpY=-int(i/_lineCount)*W;
			}
			dis=_buffList[i];
			dis.x=tmpX;
			dis.y=tmpY;
		}
		private function sort():void
		{
			var len:int=_buffList.length;
			for (var i:int = 0; i < len; i++) 
			{
				setIcoPos(_buffList[i],i);
			}
		}
	}
}