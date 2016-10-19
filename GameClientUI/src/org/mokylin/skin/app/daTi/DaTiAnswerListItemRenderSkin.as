package org.mokylin.skin.app.daTi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DaTiAnswerListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var cb:feathers.controls.Check;

		public var image:feathers.controls.UIAsset;

		public var lbAnswer:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DaTiAnswerListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.elementsContent = [image_i(),cb_i(),lbAnswer_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function cb_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cb = temp;
			temp.name = "cb";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.iconPosition = "left";
			temp.label = "标签";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_4;
			temp.textAlign = "left";
			temp.color = 0x6E3117;
			temp.width = 434;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function image_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			image = temp;
			temp.name = "image";
			temp.styleName = "ui/app/daTi/zheng-que.png";
			temp.width = 449;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbAnswer_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAnswer = temp;
			temp.name = "lbAnswer";
			temp.bold = true;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 414;
			temp.x = 29;
			temp.y = 5;
			return temp;
		}

	}
}