package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TongYongHead3 extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TongYongHead3()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__TongYongHead3_UIAsset1_i(),__TongYongHead3_UIAsset2_i(),__TongYongHead3_UIAsset3_i(),__TongYongHead3_UIAsset4_i(),__TongYongHead3_UIAsset5_i(),__TongYongHead3_UIAsset6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TongYongHead3_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/head_10.png";
			temp.x = -2;
			temp.y = 36;
			return temp;
		}

		private function __TongYongHead3_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/head_3.png";
			temp.x = 92;
			temp.y = 4;
			return temp;
		}

		private function __TongYongHead3_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/common/background/head_3.png";
			temp.x = 345;
			temp.y = 4;
			return temp;
		}

		private function __TongYongHead3_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/head_6.png";
			temp.width = 213;
			temp.x = 112;
			temp.y = -5;
			return temp;
		}

		private function __TongYongHead3_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/alphapng/background/head_8.png";
			temp.x = -13;
			temp.y = -8;
			return temp;
		}

		private function __TongYongHead3_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/alphapng/background/head_8.png";
			temp.x = 450;
			temp.y = -8;
			return temp;
		}

	}
}