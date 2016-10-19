package org.mokylin.skin.app.taskDiailog
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogNarratorSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labBG:feathers.controls.UIAsset;

		public var labDiailog:feathers.controls.TextArea;

		public var labLeftame:feathers.controls.Label;

		public var labRightName:feathers.controls.Label;

		public var labTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogNarratorSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 600;
			this.elementsContent = [labBG_i(),labLeftame_i(),labRightName_i(),labDiailog_i(),labTime_i()];
			
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
			temp.height = 100;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 600;
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function labDiailog_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labDiailog = temp;
			temp.name = "labDiailog";
			temp.height = 45;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "ssssssssssssssssssss";
			temp.color = 0xDED8C7;
			temp.width = 526;
			temp.x = 40;
			temp.y = 32;
			return temp;
		}

		private function labLeftame_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLeftame = temp;
			temp.name = "labLeftame";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "NPC名";
			temp.color = 0xE59507;
			temp.width = 124;
			temp.x = 12;
			temp.y = 10;
			return temp;
		}

		private function labRightName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labRightName = temp;
			temp.name = "labRightName";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "我的名字";
			temp.textAlign = "right";
			temp.color = 0xE59507;
			temp.width = 105;
			temp.x = 486;
			temp.y = 8;
			return temp;
		}

		private function labTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTime = temp;
			temp.name = "labTime";
			temp.text = "标签";
			temp.color = 0xDED8C7;
			temp.width = 93;
			temp.x = 495;
			temp.y = 79;
			return temp;
		}

	}
}