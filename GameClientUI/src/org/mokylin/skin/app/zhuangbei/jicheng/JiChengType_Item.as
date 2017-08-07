package org.mokylin.skin.app.zhuangbei.jicheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiChengType_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var rdo_type:feathers.controls.Check;

		public var uiHead:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiChengType_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 520;
			this.elementsContent = [rdo_type_i(),labelDisplay_i(),uiHead_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "强化等级：<font color='#cfc6ae'>1</font><font color='#5DBD37'>(+3)</font>";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 170;
			temp.x = 154;
			temp.y = 4;
			return temp;
		}

		private function rdo_type_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			rdo_type = temp;
			temp.name = "rdo_type";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.x = 5;
			temp.y = 3;
			return temp;
		}

		private function uiHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead = temp;
			temp.name = "uiHead";
			temp.styleName = "ui/app/zhuangbei/jicheng/qianghua.png";
			temp.x = 35;
			temp.y = 4;
			return temp;
		}

	}
}