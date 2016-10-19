package org.mokylin.skin.mainui.map.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonMapscale_incre extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonMapscale_incre_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonMapscale_incre_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonMapscale_incre_UIAsset3:feathers.controls.UIAsset;

		public var __ButtonMapscale_incre_UIAsset4:feathers.controls.UIAsset;

		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonMapscale_incre()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			__ButtonMapscale_incre_UIAsset1_i();
			__ButtonMapscale_incre_UIAsset2_i();
			__ButtonMapscale_incre_UIAsset3_i();
			__ButtonMapscale_incre_UIAsset4_i();
			
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
					]
			};
			skinNames={"up":"ui/mainui/map/button/mapscale_incre/up.png",
			"disabled":"ui/mainui/map/button/mapscale_incre/disabled.png",
			"hover":"ui/mainui/map/button/mapscale_incre/over.png",
			"down":"ui/mainui/map/button/mapscale_incre/down.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonMapscale_incre_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonMapscale_incre_UIAsset1 = temp;
			temp.styleName = "ui/mainui/map/button/mapscale_incre/disabled.png";
			return temp;
		}

		private function __ButtonMapscale_incre_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonMapscale_incre_UIAsset2 = temp;
			temp.styleName = "ui/mainui/map/button/mapscale_incre/down.png";
			return temp;
		}

		private function __ButtonMapscale_incre_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonMapscale_incre_UIAsset3 = temp;
			temp.styleName = "ui/mainui/map/button/mapscale_incre/over.png";
			return temp;
		}

		private function __ButtonMapscale_incre_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonMapscale_incre_UIAsset4 = temp;
			temp.styleName = "ui/mainui/map/button/mapscale_incre/up.png";
			return temp;
		}

		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.text = "";
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}