package   com.rpgGame.app.fight.spell.slotmachine
{
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.TextUtil;
	
	import away3d.events.Event;
	
	import starling.display.Sprite;

	
	public class SlotMachineCon extends Sprite
	{
		public static const ALLLISTSTOP:String = "all_list_stop";
		public static const NORMAL_ALL:int = 0;
		public static const RIGHT_TO_LEFT:int = 1;
		public static const LEFT_TO_RIGHT:int = 2;
		
		private var scrollType:int;
		public var _rewardListVec:Vector.<RewardList> = new Vector.<RewardList>();
		private var stopListCount:int = 0; // 已经停止的奖励队列计数
		private var _rewardListPool:Array=[];
		private var _resUrl:String;
		private var _numWidth:int;
		private var _isZeroHide:Boolean;
		public function SlotMachineCon(url:String,numW:int,type:int = NORMAL_ALL)
		{
			scrollType = type;
			this._resUrl=url;
			this._numWidth=numW;
		}
		public function setData( lastValue:int, value:int,dir):void
		{
			clearRewardList();
			var lastValueStr:String = lastValue.toString();
			var valueStr:String = value.toString();
			
			var numArr:Array = TextUtil.strToArr( valueStr );
			var length:int = numArr.length > lastValueStr.length ? numArr.length : lastValueStr.length;
			while( numArr.length < lastValueStr.length )
			{
				numArr.unshift( 0 );
			}
			var addP:int=0;
			//补位
			while( numArr.length > lastValueStr.length )
			{
				lastValueStr = '0'.concat( lastValueStr );
				addP++;
			}
			var listWidth:int = 21;//Mgr.resMgr.getBitmap( ResUrl.toNumberUrl( "num.0" ) ).width - 5;
			for ( var index:int = 0; index < length; index++ )
			{
				var rewardList:RewardList =getRewardList();
				rewardList.setData(int( lastValueStr.substr( index, 1 ) ), dir, 200,addP<1 );
				rewardList.setFinalReward(numArr[index]);
				rewardList.x = index * listWidth;
				rewardList.y = 0;
				addRewardList( rewardList );
				setRewardListSpeed( index, 5, 40, 2 );
				addP--;
			}
		}
		private  function getRewardList():RewardList
		{
			if (_rewardListPool.length>0) 
			{
				return _rewardListPool.pop();
			}
			return new RewardList(_resUrl);
		}
		/**
		 * 增加一列奖励列表 
		 * 
		 */	
		private  function addRewardList( rewardList:RewardList ):void
		{
			_rewardListVec.push( rewardList );
			rewardList.addEventListener( RewardList.REWARDlISTSTOP, rewardListStopHandler );
			addChild( rewardList );
		}
		
		protected function rewardListStopHandler(event:RewardListStopEvent ):void
		{
			// TODO Auto-generated method stub
			if ( _rewardListVec.length == 0 )
				return;
			if (_isZeroHide) 
			{
				if (event.rewardItem.data==0) 
				{
					MCUtil.removeSelf(event.rewardItem);
				}
			}
			stopListCount++;
			if ( stopListCount == _rewardListVec.length )
			{
				dispatchEvent( new Event(ALLLISTSTOP) );
				stopListCount = 0;
				for each( rewardList in _rewardListVec )
					rewardList.setOutVisible();
				return;
			}
			var rewardList:RewardList
			if( scrollType == RIGHT_TO_LEFT )
			{
				rewardList = _rewardListVec[ _rewardListVec.length - stopListCount - 1 ];
				rewardList.startScroll();
			}
			else if( scrollType == LEFT_TO_RIGHT )
			{
				rewardList= _rewardListVec[ stopListCount ];
				rewardList.startScroll();
			}
		}
		
		public function startRoll():void
		{
			var rewardList:RewardList;
			switch( scrollType )
			{
				case NORMAL_ALL:
					for each( rewardList in _rewardListVec )
						rewardList.startScroll();
					break;
				case RIGHT_TO_LEFT:
					if( _rewardListVec.length > 0 )
					{
						rewardList = _rewardListVec[ _rewardListVec.length - 1 ];
						rewardList.startScroll();
					}
					break;
				case LEFT_TO_RIGHT:
					if( _rewardListVec.length > 0 )
					{
						rewardList = _rewardListVec[ 0 ];
						rewardList.startScroll();
					}
					break;
			}
		}
		
		public function stopRoll():void
		{
			for each( var rewardList:RewardList in _rewardListVec )
				rewardList.stopScroll();
		}
		
		public function stopRollRightNow():void
		{
			for each( var rewardList:RewardList in _rewardListVec )
				rewardList.stopRightNow();
		}
		
		/**
		 * 设置某一图片 列的加速度与速度信息
		 * @param index			图片列列号，从0开始，自左往右依次增加
		 * @param acceleration	加速度，默认值为0，即不设置
		 * @param maxSpeed		最大速度，默认值为0，即不设置
		 * @param minSpeed 		最小速度，默认值为0，即不设置
		 */		
		public function setRewardListSpeed( index:int, acceleration:Number=0, maxSpeed:Number=0, minSpeed:Number = 0 ):void
		{
			if ( index < 0 || index >= _rewardListVec.length )
				return;
			
			if( acceleration != 0 )
				_rewardListVec[index].accelearation = acceleration; 
			if( maxSpeed != 0 )
				_rewardListVec[index].maxSpeed = maxSpeed; 
			if( minSpeed != 0 )
				_rewardListVec[index].minSpeed = minSpeed;
		}
		/**
		 * 设置某一列的奖励 
		 * @param index
		 * @param rewardID
		 * 
		 */		
		public function setReward( index:int, rewardID:int, pos:int = -1):void
		{
			if ( index < 0 || index >= _rewardListVec.length )
				return;
			_rewardListVec[index].setFinalReward( rewardID, pos );
		}
		
		public function clearRewardList():void
		{
			for each( var rewardList:RewardList in _rewardListVec )
			{
				rewardList.removeEventListener( RewardList.REWARDlISTSTOP, rewardListStopHandler );
				this.removeChild( rewardList );
				_rewardListPool.push(rewardList);
			}
			stopRollRightNow();
			_rewardListVec.length = 0;
			stopListCount = 0;
		}
		
		public function autoStop():void
		{
			for each( var rewardList:RewardList in _rewardListVec )
				rewardList.isAutoStop = true;
		}
		
		public function get isRunning():Boolean
		{
			for each( var rewardlist:RewardList in _rewardListVec )
			{
				if ( rewardlist.state != 0 )
					return true;
			}
			return false;
		}

		public function get isZeroHide():Boolean
		{
			return _isZeroHide;
		}

		public function set isZeroHide(value:Boolean):void
		{
			_isZeroHide = value;
		}

	}
}