# PowerShell 7+
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Net.Http

$gqlUrl = 'https://offer-api-prd.delta.com/prd/rm-offer-gql'

$query = @'
query ($offerSearchCriteria: OfferSearchCriteriaInput!) {
  gqlSearchOffers(offerSearchCriteria: $offerSearchCriteria) {
    offerResponseId
    gqlOffersSets {
      trips {
        tripId
        scheduledDepartureLocalTs
        scheduledArrivalLocalTs
        originAirportCode
        destinationAirportCode
        stopCnt
        flightSegment {
          aircraftTypeCode
          dayChange
          destinationAirportCode
          flightLeg {
            legId
            dayChange
            destinationAirportCode
            feeRestricted
            scheduledArrivalLocalTs
            scheduledDepartureLocalTs
            layover {
              destinationAirportCode
              layoverAirportCode
              layoverDuration { hourCnt minuteCnt }
              departureFlightNum
              equipmentChange
              originAirportCode
              scheduledArrivalLocalTs
              scheduledDepartureLocalTs
            }
            operatedByOwnerCarrier
            redEye
            operatingCarrier { carrierCode carrierName }
            marketingCarrier { carrierCode carrierName }
            earnLoyaltyMiles
            loyaltyMemberBenefits
            dominantLeg
            duration { dayCnt hourCnt minuteCnt }
            originAirport { airportTerminals { terminalId } }
            destinationAirport { airportTerminals { terminalId } }
            originAirportCode
            aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
            carrierCode
            distance { unitOfMeasure unitOfMeasureCnt }
          }
          layover {
            destinationAirportCode
            layoverAirportCode
            layoverDuration { hourCnt minuteCnt }
            departureFlightNum
            equipmentChange
            originAirportCode
            scheduledArrivalLocalTs
            scheduledDepartureLocalTs
          }
          marketingCarrier { carrierCode carrierNum }
          operatingCarrier { carrierCode carrierNum carrierName }
          pendingGovtApproval
          destinationCityCode
          flightSegmentNum
          originAirportCode
          originCityCode
          scheduledArrivalLocalTs
          scheduledDepartureLocalTs
          aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
        }
        totalTripTime { dayCnt hourCnt minuteCnt }
        summarizedProductId
      }
      additionalOfferSetProperties {
        globalUpgradeCertificateTripStatus { brandId upgradeAvailableStatusProductId }
        regionalUpgradeCertificateTripStatus { brandId upgradeAvailableStatusProductId }
        offerSetId
        seatReferenceId
        discountInfo { discountPct discountTypeCode nonDiscountedOffersAvailable }
        promotionsInfo { promotionalCode promotionalPct }
        discountInEligibilityList { code reason }
      }
      offerSetBadges { brandId }
      offers {
        offerId
        additionalOfferProperties {
          offered offerPriorityNum fareType dominantSegmentBrandId priorityNum soldOut
          unavailableForSale refundable
          offerBadges { brandId }
          payWithMilesEligible discountAvailable travelPolicyStatus secondarySolutionRefIds
        }
        soldOut
        offerItems {
          retailItems {
            retailItemMetaData {
              fareInformation {
                solutionId ticketDesignatorCode
                brandByFlightLegs {
                  brandId cosCode tripId
                  product { brandId typeCode }
                  globalUpgradeCertificateLegStatus { upgradeAvailableStatusProductId }
                  regionalUpgradeCertificateLegStatus { upgradeAvailableStatusProductId }
                  flightSegmentNum flightLegNum
                }
                discountInEligibilityList { code reason }
                availableSeatCnt
                farePrice {
                  discountsApplied {
                    pct code description reason
                    amount {
                      currencyEquivalentPrice { currencyAmt }
                      milesEquivalentPrice { mileCnt discountMileCnt }
                    }
                  }
                  totalFarePrice {
                    currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                    milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                  }
                  originalTotalPrice {
                    currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                    milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                  }
                  promotionalPrices {
                    price {
                      currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                      milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    offerDataList {
      responseProperties {
        discountInfo { discountPct discountTypeCode nonDiscountedOffersAvailable }
        promotionsInfo { promotionalCode promotionalPct }
        discountInEligibilityList { code reason }
        resultsPerRequestNum pageResultCnt resultsPageNum
        sortOptionsList { sortableOptionDesc sortableOptionId }
        tripTypeText
      }
      offerPreferences {
        stopCnt destinationAirportCode
        connectionTimeRange { maximumNum minimumNum }
        originAirportCode
        flightDurationRange { maximumNum minimumNum }
        layoverAirportCode
        totalMilesRange { maximumNum minimumNum }
        totalPriceRange { maximumNum minimumNum }
      }
      retailItemDefinitionList { brandType retailItemBrandId refundable retailItemPriorityText }
      pricingOptions { pricingOptionDetail { currencyCode } }
    }
    gqlSelectedOfferSets {
      trips {
        tripId
        scheduledDepartureLocalTs
        scheduledArrivalLocalTs
        originAirportCode
        destinationAirportCode
        stopCnt
        flightSegment {
          destinationAirportCode
          marketingCarrier { carrierCode carrierNum }
          operatingCarrier { carrierCode carrierNum }
          flightSegmentNum
          originAirportCode
          scheduledArrivalLocalTs
          scheduledDepartureLocalTs
          aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
          flightLeg {
            destinationAirportCode feeRestricted
            layover {
              destinationAirportCode layoverAirportCode
              layoverDuration { hourCnt minuteCnt }
              departureFlightNum equipmentChange originAirportCode
              scheduledArrivalLocalTs scheduledDepartureLocalTs
            }
            operatedByOwnerCarrier redEye
            operatingCarrier { carrierCode carrierName }
            marketingCarrier { carrierCode carrierName }
            earnLoyaltyMiles loyaltyMemberBenefits dominantLeg
            duration { dayCnt hourCnt minuteCnt }
            originAirport { airportTerminals { terminalId } }
            destinationAirport { airportTerminals { terminalId } }
            originAirportCode
            aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
            carrierCode
            distance { unitOfMeasure unitOfMeasureCnt }
            scheduledArrivalLocalTs scheduledDepartureLocalTs dayChange legId
          }
        }
        totalTripTime { dayCnt hourCnt minuteCnt }
      }
      offers {
        additionalOfferProperties { dominantSegmentBrandId fareType }
        soldOut
        offerItems { retailItems { retailItemMetaData { fareInformation { brandByFlightLegs { tripId brandId cosCode } } } } }
      }
      additionalOfferSetProperties { seatReferenceId }
    }
  }
}
'@

# ---- Variables (PowerShell hashtable) ----
$variables = @{
  offerSearchCriteria = @{
    productGroups = @(@{ productCategoryCode = 'FLIGHTS' })
    offersCriteria = @{
      resultsPageNum       = 1
      resultsPerRequestNum = 20
      preferences = @{
        refundableOnly                         = $false
        showGlobalRegionalUpgradeCertificate   = $true
        nonStopOnly                            = $false
      }
      pricingCriteria = @{ priceableIn = @('CURRENCY') }
      flightRequestCriteria = @{
        currentTripIndexId  = '0'
        sortableOptionId    = $null
        selectedOfferId     = ''
        searchOriginDestination = @(
          @{
            departureLocalTs = '2025-10-14T00:00:00'
            destinations     = @(@{ airportCode = 'ATH' })
            origins          = @(@{ airportCode = 'JFK' })
          }
        )
        sortByBrandId = 'BE'
        additionalCriteriaMap = @{ rollOutTag = 'GBB' }
      }
    }
    customers = @(@{ passengerTypeCode = 'ADT'; passengerId = '1' })
  }
}

# Build JSON
$bodyJson = @{
  query     = $query
  variables = $variables
} | ConvertTo-Json -Depth 12

# Set up handler with decompression and no Expect: 100-continue
$handler = [System.Net.Http.SocketsHttpHandler]::new()
$handler.AutomaticDecompression = [System.Net.DecompressionMethods]::GZip -bor `
                                  [System.Net.DecompressionMethods]::Deflate -bor `
                                  [System.Net.DecompressionMethods]::Brotli
$handler.UseCookies = $false
$handler.AllowAutoRedirect = $true

$client = [System.Net.Http.HttpClient]::new($handler)
$client.DefaultRequestVersion = [Version]'2.0'
$client.DefaultVersionPolicy  = [System.Net.Http.HttpVersionPolicy]::RequestVersionOrHigher

# Build request
$req = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Post, $gqlUrl)

# Headers (same as curl, minus pseudo-headers)
$req.Headers.TryAddWithoutValidation('accept',            'application/json, text/plain, */*') | Out-Null
$req.Headers.TryAddWithoutValidation('accept-language',   'en-GB,en;q=0.9,el-GR;q=0.8,el;q=0.7,en-US;q=0.6') | Out-Null
$req.Headers.TryAddWithoutValidation('airline',           'DL') | Out-Null
$req.Headers.TryAddWithoutValidation('applicationid',     'DC') | Out-Null
$req.Headers.TryAddWithoutValidation('authorization',     'GUEST') | Out-Null
$req.Headers.TryAddWithoutValidation('cache-control',     'no-cache') | Out-Null
$req.Headers.TryAddWithoutValidation('channelid',         'DCOM') | Out-Null
$req.Headers.TryAddWithoutValidation('origin',            'https://www.delta.com') | Out-Null
$req.Headers.TryAddWithoutValidation('pragma',            'no-cache') | Out-Null
$req.Headers.TryAddWithoutValidation('referer',           'https://www.delta.com/') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-ch-ua',         '"Chromium";v="140", "Not=A?Brand";v="24", "Google Chrome";v="140"') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-ch-ua-mobile',  '?0') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-ch-ua-platform','"Windows"') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-fetch-dest',    'empty') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-fetch-mode',    'cors') | Out-Null
$req.Headers.TryAddWithoutValidation('sec-fetch-site',    'same-site') | Out-Null
$req.Headers.TryAddWithoutValidation('transactionid',     '5ae0375f-e4f4-4e60-92f6-5815d72aa711_1758503123068') | Out-Null
$req.Headers.TryAddWithoutValidation('x-app-type',        'shop-mach') | Out-Null
$req.Headers.TryAddWithoutValidation('user-agent',        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36') | Out-Null
$req.Headers.ExpectContinue = $false   # avoid 100-continue dance

# Body as StringContent (this sets Content-Length automatically, like curl)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$req.Content = New-Object System.Net.Http.StringContent($bodyJson, $utf8NoBom, 'application/json')

# Send
$resp = $client.Send($req)
$raw  = $resp.Content.ReadAsStringAsync().Result

Write-Host "HTTP $([int]$resp.StatusCode)"
$raw
