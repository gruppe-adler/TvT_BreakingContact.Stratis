class GRAD_EGSpectator {
	tag = "GRAD";

	class Misc {
		file = "A3\functions_f_exp_a\Misc";

		class getIntersectionsUnderCursor {
		};

		class getObjectBBD {
		};

		class getName {
		};

		class getNetMode {
		};
	};

	class Math {
		file = "A3\functions_f_exp_a\Math";

		class lerp {
		};

		class getAngleDelta {
		};
	};

	class Spectator {
		file = "GRAD_EGSpectator\functions";

		class EGObjectiveVisualizer {
		};

		class EGObjectiveVisualizerDraw {
		};

		class EGSpectator {
		};

		class EGSpectatorCamera {
		};

		class EGSpectatorCameraTick {
		};

		class EGSpectatorCameraSetTarget {
		};

		class EGSpectatorCameraResetTarget {
		};

		class EGSpectatorCameraPrepareTarget {
		};

		class EGSpectatorDraw2D {
		};

		class EGSpectatorDraw3D {
		};

		class EGSpectatorGetUnitsToDraw {
		};

		class RscDisplayEGSpectator {
		};
	};
};

enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
}
