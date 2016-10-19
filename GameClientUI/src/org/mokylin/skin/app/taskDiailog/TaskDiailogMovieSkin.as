package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogMovieSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labBG:feathers.controls.UIAsset;

		public var labLeftName:feathers.controls.Label;

		public var labRightName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogMovieSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 800;
			this.elementsContent = [labBG_i(),labLeftName_i(),labRightName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			labBG = temp;
			temp.name = "labBG";
			temp.height = 150;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 800;
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function labLeftName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLeftName = temp;
			temp.name = "labLeftName";
			temp.text = "标签";
			temp.width = 124;
			temp.x = 22;
			temp.y = 13;
			return temp;
		}

		private function labRightName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRightName = temp;
			temp.name = "labRightName";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.width = 105;
			temp.x = 680;
			temp.y = 15;
			return temp;
		}

	}
}