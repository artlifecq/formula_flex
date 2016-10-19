package org.mokylin.skin.app.dailyTaskEventTrack
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.number.UINumberSkin_sz;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingCDskin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgTouJing:feathers.controls.UIAsset;

		public var uiNumber:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingCDskin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 76;
			this.width = 76;
			this.elementsContent = [imgTouJing_i(),uiNumber_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgTouJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTouJing = temp;
			temp.name = "imgTouJing";
			temp.height = 76;
			temp.styleName = "ui/mainui/task/jing.png";
			temp.width = 76;
			temp.x = 0;
			temp.y = -3;
			return temp;
		}

		private function uiNumber_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumber = temp;
			temp.name = "uiNumber";
			temp.gap = -4;
			temp.height = 24;
			temp.label = "9";
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.tween = false;
			temp.width = 24;
			temp.x = 29;
			temp.y = 23;
			return temp;
		}

	}
}