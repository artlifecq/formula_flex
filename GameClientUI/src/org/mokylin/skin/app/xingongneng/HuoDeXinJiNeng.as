package org.mokylin.skin.app.xingongneng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuoDeXinJiNeng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icons:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuoDeXinJiNeng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 123;
			this.width = 306;
			this.elementsContent = [__HuoDeXinJiNeng_UIAsset1_i(),__HuoDeXinJiNeng_Label1_i(),lbName_i(),Icons_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 21;
			temp.y = 24;
			return temp;
		}

		private function __HuoDeXinJiNeng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "恭喜你获得了新技能！";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 140;
			temp.y = 31;
			return temp;
		}

		private function __HuoDeXinJiNeng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/xingongneng/xinjinnenghuode.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 18;
			temp.text = "[掏你心心]";
			temp.textAlign = "center";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 124;
			temp.y = 72;
			return temp;
		}

	}
}