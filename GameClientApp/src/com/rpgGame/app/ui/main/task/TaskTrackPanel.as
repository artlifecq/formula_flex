package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangTouJing;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.dailyTaskEventTrack.TouJingTrackSkin;
	
	import starling.events.Event;
	
	/**
	 * 夺经、刺探、运镖 追踪栏子面板
	 * @author 陈鹉光
	 * 
	 */	
	public class TaskTrackPanel extends SkinUI
	{
		/** 夺经、刺探、运镖 追踪栏子面板 **/
		private var _skin:TouJingTrackSkin;
//		/** 偷经标签页 **/
//		private var _skinTouJing:ToujingEvenTrackPanel;
//		/** 运镖标签页 **/
//		private var _skinYunBiao:YunBiaoEventTrackPanel;
//		/** 刺探标签页 **/
//		private var _skinCiTan:CiTanEventTrackPanel;
		/** 追踪栏的标签所有的数据 **/
		private var _tabTitleArr:Array = [];
		/** 标签数据 **/
		private var _arr:Array = [];
		/** 标签文字 **/
		private static const TITLENAME:Array = LanguageConfig.getText( LangTouJing.TASK_TYPE ).split(";");
		/** 去重标签数据 **/
		private var _newArr:Array = [];
		
		public function TaskTrackPanel()
		{
			_skin = new TouJingTrackSkin();
			super(_skin);
			init();
		}
		
		/**
		 * 面板初始化 
		 * 
		 */		
		private function init():void
		{
			initPanel();
			onChexkOnline();
			EventManager.addEvent( YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onChexkOnline );
		}
		
		/**
		 *当面板显示时,给子类处理自身逻辑
		 */	
		override protected function onShow():void
		{
			_skin.tabBar.addEventListener( Event.CHANGE, onChangeEvent );
			
			EventManager.addEvent( TouJingEvent.TOUJING_ACCEPT_TASK, updateAcceptTask );
			EventManager.addEvent( TouJingEvent.MIXIN_ACCEPT_TASK, updateAcceptTask );
			EventManager.addEvent( YunBiaoEvent.ACCEPT_BIAO, updateAcceptTask );
			
			EventManager.addEvent( TouJingEvent.TOUJING_COMPLETE, updateCompleteTask );
			EventManager.addEvent( TaskEvent.MIXIN_COMPLETED_SUCCES, updateCompleteTask );
			EventManager.addEvent( TaskEvent.MIXIN_GIVEUP_SUCCES, updateCompleteTask );
			EventManager.addEvent( YunBiaoEvent.COMPLETED_BIAO, updateCompleteTask );
			EventManager.addEvent( YunBiaoEvent.BIAO_DISAPPER, updateCompleteTask );
			
			EventManager.addEvent( TouJingEvent.TOU_JING_NPC, onSetTabIndex );
			EventManager.addEvent( TouJingEvent.MI_XIN_NPC, onSetTabIndex );
			EventManager.addEvent(TouJingEvent.YUN_BIAO, onSetTabIndex);
			EventManager.addEvent( YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onChexkOnline );
		}
		
		/**
		 *被动方法,当SkinUI子类实例从显示列表移除后会被调用
		 */	
		override protected function onHide():void
		{
			_skin.tabBar.removeEventListener( Event.CHANGE, onChangeEvent );
			
			EventManager.removeEvent( TouJingEvent.TOUJING_ACCEPT_TASK, updateAcceptTask );
			EventManager.removeEvent( TouJingEvent.MIXIN_ACCEPT_TASK, updateAcceptTask );
			EventManager.removeEvent( YunBiaoEvent.ACCEPT_BIAO, updateAcceptTask );
			
			EventManager.removeEvent( TouJingEvent.TOUJING_COMPLETE, updateCompleteTask );
			EventManager.removeEvent( TaskEvent.MIXIN_COMPLETED_SUCCES, updateCompleteTask );
			EventManager.removeEvent( TaskEvent.MIXIN_GIVEUP_SUCCES, updateCompleteTask );
			EventManager.removeEvent( YunBiaoEvent.COMPLETED_BIAO, updateCompleteTask );
			EventManager.removeEvent( YunBiaoEvent.BIAO_DISAPPER, updateCompleteTask );
			
			EventManager.removeEvent( TouJingEvent.TOU_JING_NPC, onSetTabIndex );
			EventManager.removeEvent( TouJingEvent.MI_XIN_NPC, onSetTabIndex );
			EventManager.removeEvent(TouJingEvent.YUN_BIAO, onSetTabIndex);
			EventManager.removeEvent( YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onChexkOnline );
		}
		
		private function initPanel():void
		{
//			_skinTouJing = new ToujingEvenTrackPanel();
//			addChild( _skinTouJing );
//			_skinTouJing.onHide();
//			
//			_skinYunBiao = new YunBiaoEventTrackPanel();
//			addChild( _skinYunBiao );
//			_skinYunBiao.onHide();
//			
//			_skinCiTan = new CiTanEventTrackPanel();
//			addChild( _skinCiTan );
//			_skinCiTan.onHide();
//			
//			_skinTouJing.x = _skinYunBiao.x = _skinCiTan.x = _skin.tabBar.x - 4;
//			_skinTouJing.y = _skinYunBiao.y = _skinCiTan.y = _skin.tabBar.y - 3;
			
			setChildIndex( _skin.tabBar, 3 );
		}
		
		/**
		 * 上线检测 
		 * 
		 */		
		private function onChexkOnline():void
		{
			var type:int = -1;
			_newArr = [];
			
			//是否有偷经任务
			if( TouJingManager.hasTouJingTask() )
			{
				type = EmEvenTrackType.TOU_JING;
				_newArr.push( EmEvenTrackType.TOU_JING );
			}
			
			//是否有密信任务
			if( MiXinManager.hasMixinTask() )
			{
				type = EmEvenTrackType.SECRET_MESSAGE;
				_newArr.push( EmEvenTrackType.SECRET_MESSAGE );
			}
			
			//是否有运镖任务
			if( YunBiaoManager.hasBiao )
			{
				type = EmEvenTrackType.YUN_BIAO;
				_newArr.push( EmEvenTrackType.YUN_BIAO );
			}
			
			type = _newArr[0];//重新上线永远显示第一个标签
			onSetTabTitle( _newArr, type );
			
			///////默认选择镖车标签页去掉
//			//是否有运镖任务
//			if( YunBiaoManager.hasBiao )
//			{
//				type = EmEvenTrackType.YUN_BIAO;
//				_newArr.push( EmEvenTrackType.YUN_BIAO );
//				if( _newArr.indexOf(type) != -1)
//				{
//					type = _newArr[_newArr.indexOf(type)];//重新上线永远显示第一个标签
//					onSetAcceptTabTitle( _newArr, type );
//				}
//			}
//			else
//			{
//				type = _newArr[0];//重新上线永远显示第一个标签
//				onSetTabTitle( _newArr, type );
//			}
		}
		
		
		/**
		 * 接受任务后刷新显示 
		 * @param type 任务类型
		 * 
		 */		
		private function updateAcceptTask( type:int=0 ):void
		{
			_arr.push( type );
			//去掉重复的
			for( var i:int = 0; i < _arr.length; i++ ) 
			{
				if( _newArr.indexOf( _arr[i] ) == -1 )
				{
					_newArr.push( _arr[i] );
				}
			}
			
			onSetAcceptTabTitle( _newArr, type );
		}
		
		/**
		 * 完成任务后刷新显示
		 * @param type 任务类型
		 * 
		 */		
		private function updateCompleteTask( type:int=0 ):void
		{
			for (var i:int = 0; i < _newArr.length; i++) 
			{
				if( _newArr[i] == type )//完成哪个任务就删除哪个任务
				{
					_newArr.splice(i,1)
				}
			}
			_arr = _newArr;
			type = _newArr[0];
			onSetTabTitle( _newArr, type );
		}
		
		/**
		 * 设置TabTitle
		 * @param arr 任务长度
		 * @param type 任务类型
		 * 
		 */		
		private function onSetAcceptTabTitle( arr:Array, type:int ):void
		{
			var tabBarData:ListCollection = new ListCollection();
			tabBarData.data = getTabTitleArr( arr );
			_skin.tabBar.dataProvider = tabBarData;
			_skin.tabBar.selectedIndex = type;
			_skin.tabBar.selectedItem = (TITLENAME[ type ] as Object);
			_tabTitleArr = getTabTitleArr( arr );
			onShowTabIndex( type );
		}
		
		/**
		 * 设置TabTitle
		 * @param arr 任务长度
		 * @param type 任务类型
		 * 
		 */		
		private function onSetTabTitle( arr:Array, type:int ):void
		{
			var w:Number = arr.length * 64;
			_skin.tabBar.width = w;
			var tabBarData:ListCollection = new ListCollection();
			tabBarData.data = getTabTitleArr( arr );
			_skin.tabBar.dataProvider = tabBarData;
			_tabTitleArr = getTabTitleArr( arr );
			onShowTabIndex( type );
		}
		
		/**
		 * 获取title  arr数据 
		 * @param arr
		 * @return 
		 * 
		 */		
		private function getTabTitleArr( arr:Array ):Array
		{
			var tabTitle:Array = [];
			for( var i:int = 0; i < arr.length; i++ )
			{
				switch( arr[i] )
				{
					case EmEvenTrackType.TOU_JING:
						tabTitle.push( TITLENAME[ EmEvenTrackType.TOU_JING ] );
						break;
					case EmEvenTrackType.SECRET_MESSAGE:
						tabTitle.push( TITLENAME[ EmEvenTrackType.SECRET_MESSAGE ] );
						break;
					case EmEvenTrackType.YUN_BIAO:
						tabTitle.push( TITLENAME[ EmEvenTrackType.YUN_BIAO ] );
						break;
					default:
						break;
				}
			}
			return tabTitle;
		}
		
		/**
		 * 点击NPC跳转到对应的标签页
		 * @param type 任务类型
		 * 
		 */		
		private function onSetTabIndex( type:int ):void
		{
			if( _skin.tabBar.selectedIndex == type )
				return;
			
			if( _tabTitleArr.indexOf( TITLENAME[ type ] ) == -1 )
				return;
			
			var tabBarData:ListCollection = new ListCollection();
			tabBarData.data = _tabTitleArr;
			_skin.tabBar.dataProvider = tabBarData;
			_skin.tabBar.selectedIndex = type;
			_skin.tabBar.selectedItem = (TITLENAME[ type ] as Object);
			onShowTabIndex( type );
		}
		
		/**
		 * tab标签切换  
		 * @param event
		 * @author 
		 */		
		private function onChangeEvent( event:Event ):void
		{
			for (var i:int = 0; i < _newArr.length; i++) 
			{
				if( _skin.tabBar.selectedIndex == i )//selectedIndex等于i   就显示该位置的选项
				{
					onShowTabIndex( _newArr[i] );
				}
			}
		}
		
		/**
		 * 选择显示的tab标签面板 
		 * @param index  
		 * @author 
		 */		
		private function onShowTabIndex( index:int ):void
		{
//			switch( index )
//			{
//				case EmEvenTrackType.TOU_JING:
//					_skinTouJing.onShow();
//					_skinCiTan.onHide();
//					_skinYunBiao.onHide();
//					break;
//				case EmEvenTrackType.SECRET_MESSAGE:
//					_skinTouJing.onHide();
//					_skinCiTan.onShow();
//					_skinYunBiao.onHide();
//					break;
//				case EmEvenTrackType.YUN_BIAO:
//					_skinTouJing.onHide();
//					_skinCiTan.onHide();
//					_skinYunBiao.onShow();
//					break;
//				default:
//					_skinTouJing.onHide();
//					_skinCiTan.onHide();
//					_skinYunBiao.onHide();
//					break;
//			}
		}	
	}
}