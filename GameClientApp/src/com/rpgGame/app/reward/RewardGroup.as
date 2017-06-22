package  com.rpgGame.app.reward
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 *用来显示奖励的通用接口 
	 * @author yfl
	 * 
	 */	
	public class RewardGroup extends Sprite
	{
		public static const ALIN_LEFT:int=0;
		public static const ALIN_CENTER:int=1;
		public static const ALIN_RIGHT:int=2;
		
		private static const S2W:Object={};
		S2W[36]=45;
		S2W[42]=51;
		S2W[48]=56;
		S2W[64]=72;
		
		private static const W2S:Object={};
		W2S[45]=36;
		W2S[51]=42;
		W2S[56]=48;
		W2S[72]=64;
		public static function size2Width(size:int):int
		{
			return S2W[size];
		}
		/**
		 *布局模式 
		 */		
		private var alin:int;
		/**
		 *一行最大显示个数 
		 */		
		private var cellMaxNum:int;
		/**
		 *行间隔 
		 */		
		private var dX:int;
		/**
		 *列间隔 
		 */		
		private var dY:int;
		
		private var grid:UIAsset;
		
		private var icons:Vector.<Object>=new Vector.<Object>();
		
		
		private var pool:Vector.<Object>=new Vector.<Object>();
		private var initW:int;
		private var initH:int;
		private var _data:Vector.<ClientItemInfo>;
		private var _needTips:Boolean;
		/**
		 * 
		 * @param g 起始格子背景
		 * @param ali 布局0左对齐1中间对齐，2右对齐
		 * @param cellNum 每行数量（中对齐的话最好设置为奇数）
		 * @param dx
		 * @param dy
		 * @param needTip
		 * 
		 */		
		public function RewardGroup(g:UIAsset,ali:int=ALIN_LEFT,cellNum:int=9,dx:int=2,dy:int=2,needTip:Boolean=true)
		{
			super();
			this.grid=g;
			this.alin=ali;
			this.initW=g.width;
			this.initH=g.height;
			this.cellMaxNum=cellNum;
			this.dX=dx;
			this.dY=dy;
			if (g.parent) 
			{
				this.x=g.x;
				this.y=g.y;
				g.parent.addChildAt(this,g.parent.getChildIndex(g));
				MCUtil.removeSelf(g);
			}
			_needTips=needTip;
		}
		public function setReward(items:Vector.<ClientItemInfo>):void
		{
			clear();
			_data=items;
			var len:int=items.length;
			var obj:Object;
			for (var i:int = 0; i < len; i++) 
			{
				obj=getIcon();
				icons.push(obj);
				FaceUtil.SetItemGrid(obj.icon,items[i],_needTips);
			}
			layout();
		}
		private function setRewardByItemInfo(items:Vector.<ItemInfo>):void
		{
			
		}
		public function setRewardByTeamItemInfo(temps:Vector.<TempItemInfo>):void
		{
			if (temps==null) 
			{
				return;
			}
			var len:int=temps.length;
			var rewards:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			var tmpi:TempItemInfo;
			for (var i:int = 0; i < len; i++) 
			{
				tmpi=temps[i];
				var tmp:ClientItemInfo=new ClientItemInfo(tmpi.mod);
				tmp.count=tmpi.num;
				rewards.push(tmp);
			}
			
			setReward(rewards);
		}
		public function setRewardByJsonStr(reward:String):void
		{
			if (reward==null||reward=="") 
			{
				return;
			}
			var arr:Array=JSONUtil.decode(reward);
			if (arr.length) 
			{
				var len:int=arr.length;
				var obj:Object;
				var rewards:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
				for (var i:int = 0; i < len; i++) 
				{
					obj=arr[i];
					var tmp:ClientItemInfo=new ClientItemInfo(obj.mod);
					tmp.count=obj.num;
				
					rewards.push(tmp);
				}
				
				setReward(rewards);
			}
			
		}
		private function layout():void
		{
			if (ALIN_LEFT==alin) 
			{
				layoutL();
			}
			else if (ALIN_CENTER==alin) 
			{
				layoutC();
			}
			else
			{
				layoutR();
			}
		}
		private function layoutL():void
		{
			var len:int=icons.length;
			var tmpX:int;
			var tmpY:int;
			var dis:DisplayObject;
			for (var i:int = 0; i < len; i++) 
			{
				dis=icons[i].bg;
				tmpX=(i%cellMaxNum)*(initW+dX);
				tmpY=int(i/cellMaxNum)*(initH+dY);	
				
				dis.x=tmpX;
				dis.y=tmpY;
				this.addChild(dis);
			}
			
		}
		private function layoutR():void
		{
			var len:int=icons.length;
			var tmpX:int;
			var tmpY:int;
			var dis:DisplayObject;
			var maxX:int=0;
			for (var i:int = 0; i < len; i++) 
			{
				dis=icons[i].bg;
				tmpX=maxX-(i%cellMaxNum)*(initW+dX);
				tmpY=int(i/cellMaxNum)*(initH+dY);	
				dis.x=tmpX;
				dis.y=tmpY;
				this.addChild(dis);
			}
		}
		private function layoutC():void
		{
			var add:int=0;
			var len:int=icons.length;
			var tmp:int=Math.min(cellMaxNum,len);
			//偶数
			if (tmp%2==0) 
			{
				add=(initW+dX)/2;
			}
			var center:int=cellMaxNum/2;
			
			var tmpX:int;
			var tmpY:int;
			var dis:DisplayObject;
			var mul:int=1;
			var last:int=0;
			
			var nowCellIndex:int=0;
			var nowRowIndex:int=0;
			for (var i:int = 0; i < len; i++) 
			{
				dis=icons[i].bg;
				nowCellIndex=i%cellMaxNum;
				if (nowCellIndex==0) 
				{
					last=0;
				}
				nowRowIndex=int(i/cellMaxNum);
				
				tmpX=last+(nowCellIndex)*(initW+dX)*mul;
				tmpY=nowRowIndex*(initH+dY);	
				dis.x=tmpX+add;
				dis.y=tmpY;
				mul*=-1;
				last=tmpX;
				this.addChild(dis);
			}
		}
		public function clear():void
		{
			for each (var icon:Object in icons) 
			{
				icon.icon.clear();
				MCUtil.removeSelf(icon.bg);
				pool.push(icon);
			}
			icons.length=0;
		}
		private function getIcon():Object
		{
			if (pool.length>0) 
			{
				return pool.pop();
			}
			var icon:IconCDFace;
			var bg:UIAsset=MCUtil.cloneUIAssert(grid);
			bg.touchGroup=false;
			var size:int=W2S[bg.width];
			if (size==0) 
			{
				size=IcoSizeEnum.ICON_36;
			}
			icon=IconCDFace.create(size);
			bg.addChild(icon);
			//设置图片的时候有设置
			//if (IcoSizeEnum.ICON_36==size||IcoSizeEnum.ICON_42==size) 
//			{
//				icon.x=(bg.width-size)/2;
//				icon.y=(bg.height-size)/2;
//			}

			
			var obj:Object={};
			obj.bg=bg;
			obj.icon=icon;
			return obj;
		}

		public function get data():Vector.<ClientItemInfo>
		{
			return _data;
		}

	}
}