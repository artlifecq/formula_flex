package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogTalkListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn0:feathers.controls.SkinnableContainer;

		public var btn1:feathers.controls.SkinnableContainer;

		public var btn2:feathers.controls.SkinnableContainer;

		public var btn3:feathers.controls.SkinnableContainer;

		public var btn4:feathers.controls.SkinnableContainer;

		public var btn5:feathers.controls.SkinnableContainer;

		public var btn6:feathers.controls.SkinnableContainer;

		public var btn7:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogTalkListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 130;
			this.width = 600;
			this.elementsContent = [btn0_i(),btn1_i(),btn2_i(),btn3_i(),btn4_i(),btn5_i(),btn6_i(),btn7_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 1;
			temp.y = 4;
			return temp;
		}

		private function btn1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn1 = temp;
			temp.name = "btn1";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 1;
			temp.y = 36;
			return temp;
		}

		private function btn2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn2 = temp;
			temp.name = "btn2";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 1;
			temp.y = 69;
			return temp;
		}

		private function btn3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn3 = temp;
			temp.name = "btn3";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 1;
			temp.y = 101;
			return temp;
		}

		private function btn4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn4 = temp;
			temp.name = "btn4";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 310;
			temp.y = 4;
			return temp;
		}

		private function btn5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn5 = temp;
			temp.name = "btn5";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 310;
			temp.y = 36;
			return temp;
		}

		private function btn6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn6 = temp;
			temp.name = "btn6";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 310;
			temp.y = 69;
			return temp;
		}

		private function btn7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn7 = temp;
			temp.name = "btn7";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.taskDiailog.TaskDiailogBtnSkin()
			temp.skin = skin
			temp.width = 290;
			temp.x = 310;
			temp.y = 101;
			return temp;
		}

	}
}