// ---------- tuning knob ----------
const double kSpeed = 1.25;     // 1.0 = normal, 2.0 = 2× slower

// ---------- geometry -------------
const logoWidth   = 120.0;
const barWidth    = 180.0;
const spacing     = 2.0;
const arrowSize   = 16.0;
const pinchX      = barWidth / logoWidth;
const pinchY      = .25;
const arrowDxEnd  = -(barWidth / 2 + spacing + arrowSize / 2);

// ---------- key times (ms @ 1×) ---
const tPinchStart  = 530;
const tTrackFade   = 600;
const tPinchEnd    = 630;
const tFillEnd     = 1080;
const tCollapseEnd = 1250;
const tAllDone      = 1450;

/// scale helper
int s(int base) => (base * kSpeed).round();

/// Convenient intervals
double itv(int from, int to) =>
    s(from) / s(tAllDone) ..toDouble();   // used only inside animation file
